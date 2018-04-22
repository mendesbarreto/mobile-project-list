//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya

enum ProjectTarget: TeamworkTargetType {
    case projects

    var path: String {
        switch self {
        case .projects: return "/projects.json"
        }
    }

    var method: Method {
        switch self {
        case .projects:
            return .get
        }
    }
}
