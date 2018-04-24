//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class TaskGatewayMock: TaskGateway {

    var invokedTasks = false
    var invokedTasksCount = 0
    var invokedTasksParameters: (byProjectId: String, Void)?
    var invokedTasksParametersList = [(byProjectId: String, Void)]()
    var stubbedTasksResult: Single<[TaskModel]>!

    func tasks(byProjectId: String) -> Single<[TaskModel]> {
        invokedTasks = true
        invokedTasksCount += 1
        invokedTasksParameters = (byProjectId, ())
        invokedTasksParametersList.append((byProjectId, ()))
        return stubbedTasksResult
    }
}
