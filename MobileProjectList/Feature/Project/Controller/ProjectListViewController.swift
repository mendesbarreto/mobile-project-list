//
// Created by douglas.barreto on 4/17/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

final class ProjectListViewController: BaseViewController, ProjectListPresenterOutput {

    private var tableView = UITableView()
    private var listProjectUseCase: ListProjectUseCase!
    private let dataSource = ProjectListDataSource()
    private let delegate = ProjectListDelegate()

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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listProjectUseCase.list()
    }

    private func setupTableView() {
        tableView.register(ProjectViewCell.self, forCellReuseIdentifier: ProjectViewCell.identifier)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }

    // MARK: ProjectListPresenterOutput

    func show(projects: [ProjectCellViewModel]) {
        dataSource.append(projects: projects)
        tableView.reloadData()
    }

    func show(alertViewModel: AlertViewModel) {
        present(AlertScreenFactory.make(viewModel: alertViewModel), animated: true)
    }
}
