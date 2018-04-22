//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya

enum PeopleTarget: TeamworkTargetType {
    case people

    var path: String {
        switch self {
        case .people: return "/people.json"
        }
    }

    var method: Method {
        switch self {
        case .people:
            return .get
        }
    }
}
