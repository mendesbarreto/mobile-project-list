//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ProjectDetailViewController: BaseViewController {

    private let projectDetailView: ProjectDetailView
    private let showProjectDetailUseCase: ShowProjectDetailInteractor

    let projectId: String

    init(projectId: String, projectDetailView: ProjectDetailView, showProjectDetailUseCase: ShowProjectDetailInteractor) {
        self.projectId = projectId
        self.projectDetailView = projectDetailView
        self.showProjectDetailUseCase = showProjectDetailUseCase
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupRx()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showProjectDetailUseCase.show(projectById: projectId)
    }

    private func setupRx() {
        projectDetailView.onPeopleRequested.emit(onNext:{ [weak self] in
            self?.onPeopleRequested()
        }).disposed(by: disposeBag)

        projectDetailView.onTaskRequested.emit(onNext:{ [weak self] in
            self?.onTaskRequested()
        }).disposed(by: disposeBag)
    }

    private func setupView() {
        view.addSubview(projectDetailView)
        projectDetailView.anchorToFit(in: view)
        view.backgroundColor = .white
    }

    private func onTaskRequested() {
        let nextViewController = TaskListViewControllerFactory.make(projectId: projectId)
        goTo(viewController: nextViewController)
    }

    private func onPeopleRequested() {
        let nextViewController = PeopleViewControllerFactory.make(projectId: projectId)
        goTo(viewController: nextViewController)
    }

    private func goTo(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ProjectDetailViewController: ProjectDetailPresenterOutput {
    func show(projectViewModel: ProjectDetailViewModel) {
        projectDetailView.bind(viewModel: projectViewModel)
    }

    func show(alertViewModel: AlertViewModel) {
        present(AlertScreenFactory.make(viewModel: alertViewModel), animated: true)
    }
}
