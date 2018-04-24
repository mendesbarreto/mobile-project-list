//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya

enum TaskTarget: TeamworkTargetType {
    case tasks(byProjectId: String)

    var path: String {
        switch self {
        case .tasks(let projectId): return "projects/\(projectId)/tasks.json"
        }
    }

    var method: Method {
        switch self {
        case .tasks: return .get
        }
    }
}
