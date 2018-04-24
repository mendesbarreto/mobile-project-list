//
// Created by douglas.barreto on 4/17/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

enum ProjectListError: Error {
    case problemToFindCellAtIndexPath
}

final class ProjectListViewController: BaseViewController, ProjectListPresenterOutput {

    private let tableView: UITableView
    private let listProjectUseCase: ListProjectInteractor
    private let dataSource: ProjectListDataSource
    //swiftlint:disable weak_delegate
    private let delegate: ProjectListDelegate

    init(listProjectUseCase: ListProjectInteractor,
         dataSource: ProjectListDataSource,
         delegate: ProjectListDelegate,
         tableView: UITableView) {
        self.tableView = tableView
        self.dataSource = dataSource
        self.delegate = delegate
        self.listProjectUseCase = listProjectUseCase
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        print("this class can not be initialized for NSCoder arg")
        return nil
    }

    // MARK: ViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupTableViewLayout()
        setupTableView()
        setupTableViewEvent()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listProjectUseCase.list()
    }

    // MARK: Private methods

    private func setupTableViewLayout() {
        view.addSubview(tableView)
        tableView.anchorToFit(in: view)
    }

    private func setupNavigationController() {
        setNavigation(title: Strings.ProjectList.Nav.title)
    }

    private func setupTableView() {
        tableView.register(ProjectViewCell.self, forCellReuseIdentifier: ProjectViewCell.identifier)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }

    private func setupTableViewEvent() {
        tableView.rx
                .itemSelected
                .map { [weak tableView] (indexPath) -> String in
                    guard let cell = tableView?.cellForRow(at: indexPath) as? ProjectViewCell else {
                        throw ProjectListError.problemToFindCellAtIndexPath
                    }
                    return cell.viewModel.identifier
                }
                .subscribe(onNext: onProjectSelected)
                .disposed(by: disposeBag)
    }

    private func onProjectSelected(id: String) {
        goToProjectDetail(withProjectId: id)
    }

    private func goToProjectDetail(withProjectId id: String) {
        navigationController?.pushViewController(ProjectDetailViewControllerFactory.make(withProjectId: id), animated: true)
    }

    // MARK: ProjectListPresenterOutput

    func show(projects: [ProjectCellViewModel]) {
        dataSource.replace(projects: projects)
        tableView.reloadData()
    }

    func show(alertViewModel: AlertViewModel) {
        present(AlertScreenFactory.make(viewModel: alertViewModel), animated: true)
    }
}
