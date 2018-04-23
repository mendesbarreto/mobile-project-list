//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class ProjectDetailPresenter: ProjectDetailPresenterInput {

    private unowned let presenterOutput: ProjectDetailPresenterOutput

    init(presenterOutput: ProjectDetailPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func show(project: Project) throws {
        let logoUlr = try project.logo.asUrl()
        let projectViewModel = ProjectDetailViewModel(logoUrl: logoUlr,
                                                      logoPlaceHolder: Assets.icPlaceHolder.image,
                                                      title: .titleLargeGray(withText: project.name),
                                                      description: .descriptionSmallGray(withText: project.description),
                                                      companyName: .titleMediumGray(withText: project.company.name),
                                                      peopleButtonTitle: .titleMediumLightGray(withText: Strings.ProjectDetail.Button.people),
                                                      tasksButtonTitle: .titleMediumLightGray(withText: Strings.ProjectDetail.Button.tasks))
        presenterOutput.show(projectViewModel: projectViewModel)
    }

    func showError() {
        presenterOutput.show(alertViewModel: ErrorAlertViewModel(title: Strings.Alert.Error.title,
                                                                 message: Strings.Alert.Error.message))
    }

    func showLoading() {
        presenterOutput.showLoading()
    }

    func hideLoading(onComplete: (() -> Void)?) {
        presenterOutput.hideLoading(onComplete: onComplete)
    }
}
