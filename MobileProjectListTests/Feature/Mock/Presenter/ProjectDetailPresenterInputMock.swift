//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class ProjectDetailPresenterInputMock: ProjectDetailPresenterInput {
    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (project: Project, Void)?
    var invokedShowParametersList = [(project: Project, Void)]()
    var stubbedShowError: Error?

    func show(project: Project) throws {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (project, ())
        invokedShowParametersList.append((project, ()))
        if let error = stubbedShowError {
            throw error
        }
    }

    var invokedShowError = false
    var invokedShowErrorCount = 0

    func showError() {
        invokedShowError = true
        invokedShowErrorCount += 1
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
