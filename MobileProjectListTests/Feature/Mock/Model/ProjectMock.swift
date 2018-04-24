//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

@testable import MobileProjectList

final class ProjectMock {

    static var project1: Project {
        return Project(id: "1",
                       company: Company(name: "Bitwise", id: "1"),
                       starred: false,
                       name: "Hello world",
                       description: "Hello", status: "",
                       category: Category(name: "", id: ""),
                       startDate: "2017-10-11",
                       logo: "http//google.com.br/image.jpg",
                       endDate: "2017-10-12", tags: [Tag(id: "1", name: "API", color: "#ffffff")])
    }

    static var project2: Project {
        return Project(id: "2",
                       company: Company(name: "Teamwork", id: "2"),
                       starred: true,
                       name: "Teamwork Project",
                       description: "Teamwork description", status: "",
                       category: Category(name: "", id: ""),
                       startDate: "2017-10-11",
                       logo: "http//google.com.br/image2.jpg",
                       endDate: "2017-10-12", tags: [Tag]())
    }

    static var validProjectList: [Project] {
        return [project1, project2]
    }
}
