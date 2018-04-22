//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ProjectListPresenter: ProjectListPresenterInput {

    private unowned let presenterOutput: ProjectListPresenterOutput

    init(presenterOutput: ProjectListPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func show(list: [Project]) throws {
        let viewModels: [ProjectCellViewModel] = try list.map { project in
            let url = try project.logo.asUrl()
            let startImage = Assets.icStart.image.withRenderingMode(.alwaysTemplate)
            var startImageColor: UIColor = .gray
            if project.starred {
                startImageColor = .yellow
            }
            return ProjectCellViewModel(name: .titleMediumGray(withText: project.name),
                                        description: .descriptionSmallGray(withText: project.description),
                                        logoUrl: url,
                                        identifier: project.id,
                                        placeHolderImage: Assets.icPlaceHolder.image,
                                        startImage: startImage,
                                        startImageColor: startImageColor)
        }
        presenterOutput.show(projects: viewModels)
    }

    func showEmptyState() {
        presenterOutput.show(alertViewModel: ErrorAlertViewModel(title: Strings.Alert.ProjectListEmpty.title,
                                                                 message: Strings.Alert.ProjectListEmpty.message))
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
