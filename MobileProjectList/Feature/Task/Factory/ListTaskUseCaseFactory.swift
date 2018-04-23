//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ListTaskUseCaseFactory {
    static func make(presenterOutput: TaskListPresenterOutput) -> ListTasksUseCase {
        let presenter = TaskListPresenter(presenterOutput: presenterOutput)
        return ListTasksUseCase(taskGateway: TaskMoyaGateway(), presenter: presenter)
    }
}
