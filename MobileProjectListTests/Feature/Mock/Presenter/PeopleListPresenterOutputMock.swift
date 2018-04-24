//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import Moya
import RxMoya

@testable import MobileProjectList

final class PeopleListPresenterOutputMock: PeopleListPresenterOutput {
    var invokedShowPeople = false
    var invokedShowPeopleCount = 0
    var invokedShowPeopleParameters: (people: [PersonViewModel], Void)?
    var invokedShowPeopleParametersList = [(people: [PersonViewModel], Void)]()

    func show(people: [PersonViewModel]) {
        invokedShowPeople = true
        invokedShowPeopleCount += 1
        invokedShowPeopleParameters = (people, ())
        invokedShowPeopleParametersList.append((people, ()))
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
