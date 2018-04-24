//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import Moya
import RxMoya
import RxSwift
import RxCocoa

final class TaskListViewController: BaseViewController {

    private let projectId: String
    private let listPeopleUseCase: ListTasksInteractor
    private let tableView: UITableView
    private let dataSource: TaskListDataSource

    init(projectId: String,
         tableView: UITableView,
         listPeopleUseCase: ListTasksInteractor,
         dataSource: TaskListDataSource) {
        self.tableView = tableView
        self.projectId = projectId
        self.listPeopleUseCase = listPeopleUseCase
        self.dataSource = dataSource
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        setupTableView()
    }

    private func setupNavigationTitle() {
        setNavigation(title: Strings.TaskList.Nav.title)
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchorToFit(in: view)
        tableView.register(TaskViewCell.self, forCellReuseIdentifier: TaskViewCell.identifier)
        tableView.dataSource = dataSource
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listPeopleUseCase.list(byProjectId: projectId)
    }
}

extension TaskListViewController: TaskListPresenterOutput {
    func show(tasksViewModel: [TaskViewModel]) {
        dataSource.replace(taskList: tasksViewModel)
        tableView.reloadData()
    }

    func show(alert: AlertViewModel) {
        present(AlertScreenFactory.make(viewModel: alert), animated: true)
    }
}
