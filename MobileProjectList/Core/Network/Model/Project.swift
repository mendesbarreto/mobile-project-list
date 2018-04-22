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
        case showAnnouncement = "show-announcement"
        case announcement
        case description
        case status
        case isProjectAdmin
        case createdOn = "created-on"
        case category
        case startPage = "start-page"
        case startDate
        case logo
        case notifyEveryone = "notifyeveryone"
        case lastChangedOn = "last-changed-on"
        case endDate
        case harvestTimersEnabled = "harvest-timers-enabled"
    }

    let id: String
    let company: Company
    let starred: Bool
    let name: String
    let showAnnouncement: Bool
    let announcement: String
    let description: String
    let status: String
    let isProjectAdmin: Bool
    let createdOn: String
    let category: Category
    let startPage: String
    let startDate: String
    let logo: String
    let notifyEveryone: Bool
    let lastChangedOn: String
    let endDate: String
    let harvestTimersEnabled: Bool
}
