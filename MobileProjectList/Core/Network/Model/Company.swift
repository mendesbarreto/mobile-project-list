//
// Created by douglas.barreto on 4/20/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct Company: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case isOwner = "is-owner"
        case id
    }

    let name: String
    let isOwner: String
    let id: String
}
