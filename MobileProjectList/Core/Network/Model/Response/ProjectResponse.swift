//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct ProjectResponse: Codable, TeamworkResponse {
    private enum CodingKeys: String, CodingKey {
        case status = "STATUS"
        case project
    }

    let status: String
    let project: Project
}
