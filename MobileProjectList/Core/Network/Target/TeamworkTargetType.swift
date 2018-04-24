//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya
import RxMoya

protocol TeamworkTargetType: TargetType {
    var parameters: [String: Any] { get }
    var parameterEncoding: ParameterEncoding { get }
}

extension TeamworkTargetType {
    var baseURL: URL { return URL(string: Strings.App.baseUrl)! }
    var parameters: [String: Any] { return [:] }

    var parameterEncoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.queryString
        default:
            return JSONEncoding.default
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }

    var headers: [String: String]? {
        return ["Accept": "application/json", "Content-Type": "application/json"]
    }
}
