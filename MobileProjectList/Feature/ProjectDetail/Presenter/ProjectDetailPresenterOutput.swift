//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol ProjectDetailPresenterOutput: class, LoadingPresenter {
    func show(projectViewModel: ProjectDetailViewModel)

    func show(alertViewModel: AlertViewModel)
}
