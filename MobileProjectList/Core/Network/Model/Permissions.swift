//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct Permissions: Codable {
    let canManagePeople: Bool
    let canAddProjects: Bool

    private enum CodingKeys: String, CodingKey {
        case canManagePeople = "can-manage-people"
        case canAddProjects = "can-add-projects"
    }
}
