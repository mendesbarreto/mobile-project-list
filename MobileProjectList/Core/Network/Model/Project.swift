//
// Created by douglas.barreto on 4/20/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct Project: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case company
        case starred
        case name
        case description
        case status
        case category
        case startDate
        case logo
        case endDate
        case tags
    }

    let id: String
    let company: Company
    let starred: Bool
    let name: String
    let description: String
    let status: String
    let category: Category
    let startDate: String
    let logo: String
    let endDate: String
    let tags: [Tag]
}
