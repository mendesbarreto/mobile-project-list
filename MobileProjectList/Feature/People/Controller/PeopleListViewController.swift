//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import Moya
import RxMoya
import RxSwift
import RxCocoa

final class PeopleListViewController: BaseViewController {

    private let projectId: String
    private var listPeopleUseCase: ListPeopleUseCase!
    private let tableView = UITableView()
    private let dataSource = PeopleListDataSource(personList: [])

    init(projectId: String) {
        self.projectId = projectId
        super.init()
        self.listPeopleUseCase = ListPeopleUseCaseFactory.make(presenterOutput: self)
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
        setNavigation(title: Strings.PeopleList.Nav.title)
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.anchorToFit(in: view)
        tableView.register(PersonViewCell.self, forCellReuseIdentifier: PersonViewCell.identifier)
        tableView.dataSource = dataSource
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        listPeopleUseCase.list(byProjectId: projectId)
    }
}

extension PeopleListViewController: PeopleListPresenterOutput {
    func show(people: [PersonViewModel]) {
        dataSource.replace(personList: people)
        tableView.reloadData()
    }

    func show(alert: AlertViewModel) {
        present(AlertScreenFactory.make(viewModel: alert), animated: true)
    }
}
