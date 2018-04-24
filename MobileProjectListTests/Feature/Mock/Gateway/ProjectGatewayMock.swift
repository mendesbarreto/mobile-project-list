//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class ProjectGatewayMock: ProjectGateway {
    var invokedProjects = false
    var invokedProjectsCount = 0
    var stubbedProjectsResult: Single<[Project]>!

    func projects() -> Single<[Project]> {
        invokedProjects = true
        invokedProjectsCount += 1
        return stubbedProjectsResult
    }

    var invokedProject = false
    var invokedProjectCount = 0
    var invokedProjectParameters: (byId: String, Void)?
    var invokedProjectParametersList = [(byId: String, Void)]()
    var stubbedProjectResult: Single<Project>!

    func project(byId: String) -> Single<Project> {
        invokedProject = true
        invokedProjectCount += 1
        invokedProjectParameters = (byId, ())
        invokedProjectParametersList.append((byId, ()))
        return stubbedProjectResult
    }
}
