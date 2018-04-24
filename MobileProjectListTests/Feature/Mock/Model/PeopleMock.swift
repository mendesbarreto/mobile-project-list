//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

@testable import MobileProjectList

final class PeopleMock {

    static var person1: Person {
        return Person(id: "1",
                      administrator: true,
                      siteOwner: false,
                      twitter: "@Douglas",
                      phoneNumberHome: "+5511987616956",
                      lastName: "Barretp",
                      emailAddress: "menddes-barreto@live.com",
                      userUUID: "123",
                      userName: "mendesbarreto",
                      companyName: "Teamwork",
                      lastChangedOn: "1880-10-11",
                      phoneNumberOffice: "",
                      deleted: false,
                      firstName: "Douglas",
                      userType: "Some",
                      avatarURL: "http//google.com.br/image.jpg",
                      title: "SR.")
    }

    static var person2: Person {
        return Person(id: "1",
                      administrator: true,
                      siteOwner: false,
                      twitter: "@Mayara",
                      phoneNumberHome: "+5511985517294",
                      lastName: "Veiga",
                      emailAddress: "mayaracristine@live.com",
                      userUUID: "1233",
                      userName: "mayaraveiga",
                      companyName: "World",
                      lastChangedOn: "1881-10-11",
                      phoneNumberOffice: "",
                      deleted: false,
                      firstName: "Mayara",
                      userType: "Some",
                      avatarURL: "http//google.com.br/image.jpg",
                      title: "Ms.")
    }

    static var people: [Person] {
        return [person1, person2]
    }
}
