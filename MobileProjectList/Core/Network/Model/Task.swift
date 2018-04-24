//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct TaskModel: Codable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "todo-list-name"
        case description = "description"
        case status = "status"
        case completed = "completed"
        case createdOn = "created-on"
        case lastChangedOn = "last-changed-on"
        case priority = "priority"
        case progress = "progress"
    }

    let id: Int
    let name: String
    let description: String
    let status: String
    let completed: Bool
    let createdOn: String
    let lastChangedOn: String
    let priority: String
    let progress: Int
}
