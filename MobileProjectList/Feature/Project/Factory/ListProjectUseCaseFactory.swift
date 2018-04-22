//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ListProjectUseCaseFactory {
    static func make(presenter: ProjectListPresenterOutput) -> ListProjectUseCase {
        let presenterInput = ProjectListPresenter(presenterOutput: presenter)
        return ListProjectUseCase(projectGateway: ProjectMoyaGateway(), presenter: presenterInput)
    }
}
