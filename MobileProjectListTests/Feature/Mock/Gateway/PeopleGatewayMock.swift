//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class PeopleGatewayMock: PeopleGateway {
    var invokedPeople = false
    var invokedPeopleCount = 0
    var stubbedPeopleResult: Single<[Person]>!

    func people() -> Single<[Person]> {
        invokedPeople = true
        invokedPeopleCount += 1
        return stubbedPeopleResult
    }

    var invokedPeopleByProjectId = false
    var invokedPeopleByProjectIdCount = 0
    var invokedPeopleByProjectIdParameters: (byProjectId: String, Void)?
    var invokedPeopleByProjectIdParametersList = [(byProjectId: String, Void)]()
    var stubbedPeopleByProjectIdResult: Single<[Person]>!

    func people(byProjectId: String) -> Single<[Person]> {
        invokedPeopleByProjectId = true
        invokedPeopleByProjectIdCount += 1
        invokedPeopleByProjectIdParameters = (byProjectId, ())
        invokedPeopleByProjectIdParametersList.append((byProjectId, ()))
        return stubbedPeopleByProjectIdResult
    }
}
