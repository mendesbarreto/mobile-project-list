//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ShowProjectDetailUseCaseFactory {
    static func make(presenterInput: ProjectDetailPresenterInput) -> ShowProjectDetailUseCase {
        return ShowProjectDetailUseCase(presenter: presenterInput, projectGateway: ProjectMoyaGateway())
    }
}
