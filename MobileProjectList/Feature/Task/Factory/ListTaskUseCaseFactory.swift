//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ListTaskUseCaseFactory {
    static func make(presenterInput: TaskListPresenterInput) -> ListTasksUseCase {
        return ListTasksUseCase(taskGateway: TaskMoyaGateway(), presenter: presenterInput)
    }
}
