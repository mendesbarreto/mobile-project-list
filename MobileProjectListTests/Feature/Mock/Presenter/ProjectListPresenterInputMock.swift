//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class ProjectListPresenterInputMock: ProjectListPresenterInput {
    var invokedShow = false
    var invokedShowCount = 0
    var invokedShowParameters: (list: [Project], Void)?
    var invokedShowParametersList = [(list: [Project], Void)]()
    var stubbedShowError: Error?

    func show(list: [Project]) throws {
        invokedShow = true
        invokedShowCount += 1
        invokedShowParameters = (list, ())
        invokedShowParametersList.append((list, ()))
        if let error = stubbedShowError {
            throw error
        }
    }

    var invokedShowEmptyState = false
    var invokedShowEmptyStateCount = 0

    func showEmptyState() {
        invokedShowEmptyState = true
        invokedShowEmptyStateCount += 1
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
