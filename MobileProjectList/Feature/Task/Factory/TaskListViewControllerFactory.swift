//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class TaskListViewControllerFactory {
    static func make(projectId: String) -> UIViewController {
        let presenterInput = TaskListPresenter()
        let listTaskUseCase = ListTaskUseCaseFactory.make(presenterInput: presenterInput)
        let viewController = TaskListViewController(projectId: projectId,
                                                    tableView: UITableView(),
                                                    listPeopleUseCase: listTaskUseCase,
                                                    dataSource: TaskListDataSource(taskList: []))
        presenterInput.setup(presenterOutput: viewController)
        return viewController
    }
}
