//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct TaskListResponse: Codable, TeamworkResponse {
    private enum CodingKeys: String, CodingKey {
        case status = "STATUS"
        case tasks = "todo-items"
    }

    let status: String
    let tasks: [TaskModel]
}
