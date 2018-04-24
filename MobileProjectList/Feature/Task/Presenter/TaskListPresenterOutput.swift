//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

protocol TaskListPresenterOutput: class, LoadingPresenter {
    func show(tasksViewModel: [TaskViewModel])
    func show(alert: AlertViewModel)
}
