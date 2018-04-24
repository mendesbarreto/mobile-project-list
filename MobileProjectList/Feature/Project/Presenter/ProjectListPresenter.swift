//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ProjectListPresenter: ProjectListPresenterInput {

    private weak var presenterOutput: ProjectListPresenterOutput?

    init(presenterOutput: ProjectListPresenterOutput? = nil) {
        self.presenterOutput = presenterOutput
    }

    func show(list: [Project]) throws {
        let viewModels: [ProjectCellViewModel] = try list.map { project in
            let url = try project.logo.asUrl()
            let startImage = Assets.icStart.image.withRenderingMode(.alwaysTemplate)
            let startImageColor = defineStartColorBy(project: project)
            let tagsViewModels = map(tags: project.tags)

            return ProjectCellViewModel(name: .titleMediumGray(withText: project.name),
                                        description: .descriptionSmallGray(withText: project.description),
                                        logoUrl: url,
                                        identifier: project.id,
                                        placeHolderImage: Assets.icPlaceHolder.image,
                                        startImage: startImage,
                                        startImageColor: startImageColor,
                                        tags: tagsViewModels)
        }
        presenterOutput?.show(projects: viewModels)
    }

    func setup(presenterOutput: ProjectListPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    private func map(tags: [Tag]) -> [TagViewModel] {
        return tags.map { tag in
            let color: UIColor = (try? UIColor(string: tag.color) ) ?? .red
            return TagViewModel(title: .titleXSmallWhite(withText: tag.name), backgroundColor: color, cornerRadios: 5)
        }
    }

    private func defineStartColorBy(project: Project) -> UIColor {
        return project.starred ? .yellow : .gray
    }

    func showEmptyState() {
        presenterOutput?.show(alertViewModel: ErrorAlertViewModel(title: Strings.Alert.ProjectListEmpty.title,
                                                                 message: Strings.Alert.ProjectListEmpty.message))
    }

    func showError() {
        presenterOutput?.show(alertViewModel: ErrorAlertViewModel(title: Strings.Alert.Error.title,
                                                                 message: Strings.Alert.Error.message))
    }

    func showLoading() {
        presenterOutput?.showLoading()
    }

    func hideLoading(onComplete: (() -> Void)?) {
        presenterOutput?.hideLoading(onComplete: onComplete)
    }
}
