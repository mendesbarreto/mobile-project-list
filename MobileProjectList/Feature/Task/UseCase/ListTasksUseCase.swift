//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import Moya
import RxMoya
import RxSwift
import RxCocoa
import NSObject_Rx
import SDWebImage

final class ListTasksUseCase: ListTasksInteractor, HasDisposeBag {

    private let taskGateway: TaskGateway
    private let presenter: TaskListPresenterInput

    init(taskGateway: TaskGateway, presenter: TaskListPresenterInput) {
        self.taskGateway = taskGateway
        self.presenter = presenter
    }

    func list(byProjectId id: String) {
        presenter.showLoading()
        taskGateway.tasks(byProjectId: id)
                   .subscribe(onSuccess: { [weak self] tasks in
                         self?.show(list: tasks)
                     }, onError: { [presenter] error in
                         print(error)
                         presenter.hideLoading {
                             presenter.showError()
                         }
                     }).disposed(by: disposeBag)
    }

    private func show(list: [TaskModel]) {
        presenter.hideLoading { [presenter] in
            if list.count > 0 {
                do {
                    try presenter.show(list: list)
                } catch {
                    presenter.showError()
                }
            } else {
                presenter.showEmptyState()
            }
        }
    }
}
