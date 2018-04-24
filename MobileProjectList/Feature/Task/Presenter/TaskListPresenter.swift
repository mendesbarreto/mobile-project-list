//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class TaskListPresenter: TaskListPresenterInput {

    private weak var presenterOutput: TaskListPresenterOutput?

    init(presenterOutput: TaskListPresenterOutput? = nil) {
        self.presenterOutput = presenterOutput
    }

    func setup(presenterOutput: TaskListPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func showError() {
        presenterOutput?.show(alert: ErrorAlertViewModel(title: Strings.Alert.Error.title,
                                                        message: Strings.Alert.Error.message))
    }

    func showEmptyState() {
        presenterOutput?.show(alert: ErrorAlertViewModel(title: Strings.Alert.ProjectListEmpty.title,
                                                        message: Strings.Alert.ProjectListEmpty.message))
    }

    func show(list: [TaskModel]) throws {
        let viewModels: [TaskViewModel] = list.map { model in
            return TaskViewModel(image: Assets.icTask.image, title: .titleMediumGray(withText: model.name))
        }

        presenterOutput?.show(tasksViewModel: viewModels)
    }

    func showLoading() {
        presenterOutput?.showLoading()
    }

    func hideLoading(onComplete: (() -> Void)?) {
        presenterOutput?.hideLoading(onComplete: onComplete)
    }
}
