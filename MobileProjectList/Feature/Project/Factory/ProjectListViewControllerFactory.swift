//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ProjectListViewControllerFactory {
    static func make() -> UIViewController {
        let presenterInput = ProjectListPresenter()
        let listProjectUseCase = ListProjectUseCaseFactory.make(presenterInput: presenterInput)
        let viewController = ProjectListViewController(listProjectUseCase: listProjectUseCase,
                                                       dataSource: ProjectListDataSource(),
                                                       delegate: ProjectListDelegate(),
                                                       tableView: UITableView())
        presenterInput.setup(presenterOutput: viewController)
        return viewController
    }
}
