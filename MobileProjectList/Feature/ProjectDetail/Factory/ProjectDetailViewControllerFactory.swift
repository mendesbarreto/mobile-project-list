//
// Created by douglas.barreto on 4/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ProjectDetailViewControllerFactory {
    static func make(withProjectId id: String) -> UIViewController {
        let presenter = ProjectDetailPresenter()
        let showProjectDetailUseCase = ShowProjectDetailUseCaseFactory.make(presenterInput: presenter)
        let viewController = ProjectDetailViewController(projectId: id,
                                                         projectDetailView: ProjectDetailView(),
                                                         showProjectDetailUseCase: showProjectDetailUseCase)
        presenter.setup(presenterOutput: viewController)
        return viewController
    }
}
