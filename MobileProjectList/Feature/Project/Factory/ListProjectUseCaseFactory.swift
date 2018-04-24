//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ListProjectUseCaseFactory {
    static func make(presenterInput: ProjectListPresenterInput) -> ListProjectInteractor {
        return ListProjectUseCase(projectGateway: ProjectMoyaGateway(), presenter: presenterInput)
    }
}
