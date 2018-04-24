//
// Created by douglas.barreto on 4/20/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct ProjectListResponse: Codable, TeamworkResponse {
    private enum CodingKeys: String, CodingKey {
        case status = "STATUS"
        case projects
    }

    let status: String
    let projects: [Project]
}
