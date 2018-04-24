//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

@testable import MobileProjectList

final class ListProjectInteractorMock: ListProjectInteractor {
    var invokedList = false
    var invokedListCount = 0

    func list() {
        invokedList = true
        invokedListCount += 1
    }
}
