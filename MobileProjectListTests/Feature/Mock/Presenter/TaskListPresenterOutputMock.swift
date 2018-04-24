//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class TaskListPresenterOutputMock: TaskListPresenterOutput {
    var invokedShowTasksViewModel = false
    var invokedShowTasksViewModelCount = 0
    var invokedShowTasksViewModelParameters: (tasksViewModel: [TaskViewModel], Void)?
    var invokedShowTasksViewModelParametersList = [(tasksViewModel: [TaskViewModel], Void)]()

    func show(tasksViewModel: [TaskViewModel]) {
        invokedShowTasksViewModel = true
        invokedShowTasksViewModelCount += 1
        invokedShowTasksViewModelParameters = (tasksViewModel, ())
        invokedShowTasksViewModelParametersList.append((tasksViewModel, ()))
    }

    var invokedShowAlert = false
    var invokedShowAlertCount = 0
    var invokedShowAlertParameters: (alert: AlertViewModel, Void)?
    var invokedShowAlertParametersList = [(alert: AlertViewModel, Void)]()

    func show(alert: AlertViewModel) {
        invokedShowAlert = true
        invokedShowAlertCount += 1
        invokedShowAlertParameters = (alert, ())
        invokedShowAlertParametersList.append((alert, ()))
    }

    var invokedShowLoading = false
    var invokedShowLoadingCount = 0

    func showLoading() {
        invokedShowLoading = true
        invokedShowLoadingCount += 1
    }

    var invokedHideLoading = false
    var invokedHideLoadingCount = 0

    func hideLoading(onComplete: (() -> Void)?) {
        invokedHideLoading = true
        invokedHideLoadingCount += 1
        _ = onComplete?()
    }
}
