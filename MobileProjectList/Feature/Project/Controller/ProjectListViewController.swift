//
// Created by douglas.barreto on 4/17/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

struct ProjectCellViewModel {
    let name: NSAttributedString
    let logoUrl: URL
    let identifier: String
}

final class ListProjectUseCase: HasDisposeBag {

    private let projectGateway: ProjectGateway
    private let presenter: ProjectListPresenterInput

    init(projectGateway: ProjectGateway, presenter: ProjectListPresenterInput) {
        self.projectGateway = projectGateway
        self.presenter = presenter
    }

    func list() {
        projectGateway.projects().subscribe(onSuccess: { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.show(list: response.projects)

        }, onError: { [weak self] error in
            print(error)
            self?.showError()
        }).disposed(by: disposeBag)
    }

    private func show(list: [Project]) {
        presenter.hideLoading { [presenter] in
            if list.count > 0 {
                do {
                    try presenter.show(list: list)
                } catch {
                    presenter.showError()
                }
            } else {
                presenter.showEmptyState()
            }
        }
    }

    private func showError() {
    presenter.showError()
}
}

final class ListProjectUseCaseFactory {
    static func make(presenter: ProjectListPresenterOutput) -> ListProjectUseCase {
        let presenterInput = ProjectListPresenter(presenterOutput: presenter)
        return ListProjectUseCase(projectGateway: ProjectMoyaGateway(), presenter: presenterInput)
    }
}

protocol ProjectListPresenterInput: LoadingPresenter {
    func show(list: [Project]) throws
    func showEmptyState()
    func showError()
}

protocol ProjectListPresenterOutput: class, LoadingPresenter {
    func show(projects: [ProjectCellViewModel])
    func show(alertViewModel: AlertViewModel)
}

struct ErrorAlertViewModel: AlertViewModel {
    let title: String
    let message: String
    let style: UIAlertControllerStyle
    private(set) var actions: [UIAlertAction] = []

    init(title: String, message: String) {
        self.title = title
        self.message = message
        self.style = .alert
        addDismissButton()
    }

    private mutating func addDismissButton() {
        let actionsOk = UIAlertAction(title: "OK", style: .cancel)
        actions.append(actionsOk)
    }
}

final class ProjectListPresenter: ProjectListPresenterInput {

    private unowned let presenterOutput: ProjectListPresenterOutput

    init(presenterOutput: ProjectListPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func show(list: [Project]) throws {
        let viewModels: [ProjectCellViewModel] = try list.map { project  in
            let url = try project.logo.asUrl()
            return ProjectCellViewModel(name: NSAttributedString(string: project.name),
                                        logoUrl: url)
        }

        presenterOutput.show(projects: viewModels)
    }

    func showEmptyState() {
    }

    func showError() {
        presenterOutput.show(alertViewModel: ErrorAlertViewModel(title: "Ops", message: "Deu muito ruim"))
    }

    func showLoading() {
        presenterOutput.showLoading()
    }

    func hideLoading(onComplete: (() -> Void)?) {
        presenterOutput.hideLoading(onComplete: onComplete)
    }
}

final class ProjectListViewController: BaseViewController, ProjectListPresenterOutput {

    private var tableView = UITableView()
    private var listProjectUseCase: ListProjectUseCase!
    private let dataSource = ProjectListDataSource()

    override init() {
        super.init()
        listProjectUseCase = ListProjectUseCaseFactory.make(presenter: self)
    }

    required init?(coder aDecoder: NSCoder) {
        print("this class can not be initialized for NSCoder arg")
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewLayout()
        setupTableView()
    }

    private func setupTableViewLayout() {
        view.addSubview(tableView)
        tableView.anchorToFit(in: view)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listProjectUseCase.list()
    }

    private func setupTableView() {
        tableView.register(ProjectViewCell.self, forCellReuseIdentifier: ProjectViewCell.identifier)
        tableView.dataSource = dataSource
    }

    func show(projects: [ProjectCellViewModel]) {
        dataSource.append(projects: projects)
    }

    func show(alertViewModel: AlertViewModel) {
        present(AlertScreenFactory.make(viewModel: alertViewModel), animated: true)
    }
}

final class ProjectListDataSource: NSObject, UITableViewDataSource {
    private var projectList: [ProjectCellViewModel] = []

    func append(projects: [ProjectCellViewModel]) {
        projectList.append(contentsOf: projects)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList.count
    }

    //swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectViewCell.identifier, for: indexPath) as! ProjectViewCell
    }
}
