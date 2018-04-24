//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

class ProjectListPresenterOutputMock: ProjectListPresenterOutput {
    var invokedShowProjects = false
    var invokedShowProjectsCount = 0
    var invokedShowProjectsParameters: (projects: [ProjectCellViewModel], Void)?
    var invokedShowProjectsParametersList = [(projects: [ProjectCellViewModel], Void)]()

    func show(projects: [ProjectCellViewModel]) {
        invokedShowProjects = true
        invokedShowProjectsCount += 1
        invokedShowProjectsParameters = (projects, ())
        invokedShowProjectsParametersList.append((projects, ()))
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
