//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

struct Person: Codable {
    let id: String
    let administrator: Bool
    let siteOwner: Bool
    let twitter: String
    let phoneNumberHome: String
    let lastName: String
    let emailAddress: String
    let userUUID: String
    let userName: String
    let companyName: String
    let lastChangedOn: String
    let phoneNumberOffice: String
    let deleted: Bool
    let firstName: String
    let userType: String
    let avatarURL: String
    let title: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case administrator = "administrator"
        case siteOwner = "site-owner"
        case twitter = "twitter"
        case phoneNumberHome = "phone-number-home"
        case lastName = "last-name"
        case emailAddress = "email-address"
        case userUUID = "userUUID"
        case userName = "user-name"
        case companyName = "company-name"
        case lastChangedOn = "last-changed-on"
        case phoneNumberOffice = "phone-number-office"
        case deleted = "deleted"
        case firstName = "first-name"
        case userType = "user-type"
        case avatarURL = "avatar-url"
        case title = "title"
    }
}
