//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol PeopleListPresenterOutput: class, LoadingPresenter {
    func show(people: [PersonViewModel])
    func show(alert: AlertViewModel)
}
