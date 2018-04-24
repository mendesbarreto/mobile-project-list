//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya

enum PeopleTarget: TeamworkTargetType {
    case people
    case peopleByProject(id: String)

    var path: String {
        switch self {
        case .people: return "/people.json"
        case .peopleByProject(let id): return "/projects/\(id)/people.json"
        }
    }

    var method: Method {
        switch self {
        case .people,
             .peopleByProject:
            return .get
        }
    }
}
