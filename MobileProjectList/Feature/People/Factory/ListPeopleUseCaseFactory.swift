//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ListPeopleUseCaseFactory {
    static func make(presenterOutput: PeopleListPresenterOutput) -> ListPeopleUseCase {
        let presenter = PeopleListPresenter(presenterOutput: presenterOutput)
        return ListPeopleUseCase(peopleGateway: PeopleMoyaGateway(), presenter: presenter)
    }
}
