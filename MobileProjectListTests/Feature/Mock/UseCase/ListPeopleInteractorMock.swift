//
// Created by douglas.barreto on 4/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

@testable import MobileProjectList

final class ListPeopleInteractorMock: ListPeopleInteractor {
    var invokedList = false
    var invokedListCount = 0
    var invokedListParameters: (id: String, Void)?
    var invokedListParametersList = [(id: String, Void)]()

    func list(byProjectId id: String) {
        invokedList = true
        invokedListCount += 1
        invokedListParameters = (id, ())
        invokedListParametersList.append((id, ()))
    }
}
