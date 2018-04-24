//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

@testable import MobileProjectList

final class TaskMock {
    static var task1: TaskModel {
        return TaskModel(id: 1,
                         name: "To do 1",
                         description: "Do the to do 1",
                         status: "In progress",
                         completed: false,
                         createdOn: "2018-04-11",
                         lastChangedOn: "2018-04-11",
                         priority: "0",
                         progress: 1)
    }

    static var task2: TaskModel {
        return TaskModel(id: 2,
                         name: "To do 2",
                         description: "Do the to do 2",
                         status: "In progress",
                         completed: false,
                         createdOn: "2018-04-12",
                         lastChangedOn: "2018-04-13",
                         priority: "1",
                         progress: 2)
    }

    static var tasks: [TaskModel] {
        return [task1, task2]
    }
}
