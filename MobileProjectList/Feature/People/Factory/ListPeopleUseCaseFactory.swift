//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ListPeopleUseCaseFactory {
    static func make(presenterInput: PeopleListPresenterInput) -> ListPeopleInteractor {
        return ListPeopleUseCase(peopleGateway: PeopleMoyaGateway(), presenter: presenterInput)
    }
}
