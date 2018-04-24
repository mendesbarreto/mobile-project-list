//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol ProjectListPresenterOutput: class, LoadingPresenter {
    func show(projects: [ProjectCellViewModel])

    func show(alertViewModel: AlertViewModel)
}
