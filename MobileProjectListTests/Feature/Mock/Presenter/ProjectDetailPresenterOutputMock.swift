//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class ProjectDetailPresenterOutputMock: ProjectDetailPresenterOutput {
    var invokedShowProjectViewModel = false
    var invokedShowProjectViewModelCount = 0
    var invokedShowProjectViewModelParameters: (projectViewModel: ProjectDetailViewModel, Void)?
    var invokedShowProjectViewModelParametersList = [(projectViewModel: ProjectDetailViewModel, Void)]()

    func show(projectViewModel: ProjectDetailViewModel) {
        invokedShowProjectViewModel = true
        invokedShowProjectViewModelCount += 1
        invokedShowProjectViewModelParameters = (projectViewModel, ())
        invokedShowProjectViewModelParametersList.append((projectViewModel, ()))
    }

    var invokedShowAlertViewModel = false
    var invokedShowAlertViewModelCount = 0
    var invokedShowAlertViewModelParameters: (alertViewModel: AlertViewModel, Void)?
    var invokedShowAlertViewModelParametersList = [(alertViewModel: AlertViewModel, Void)]()

    func show(alertViewModel: AlertViewModel) {
        invokedShowAlertViewModel = true
        invokedShowAlertViewModelCount += 1
        invokedShowAlertViewModelParameters = (alertViewModel, ())
        invokedShowAlertViewModelParametersList.append((alertViewModel, ()))
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
