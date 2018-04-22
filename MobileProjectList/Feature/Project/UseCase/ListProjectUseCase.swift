//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

final class ListProjectUseCase: HasDisposeBag {

    private let projectGateway: ProjectGateway
    private let presenter: ProjectListPresenterInput

    init(projectGateway: ProjectGateway, presenter: ProjectListPresenterInput) {
        self.projectGateway = projectGateway
        self.presenter = presenter
    }

    func list() {
        presenter.showLoading()
        projectGateway.projects().subscribe(onSuccess: { [weak self] response in
            guard let strongSelf = self else {
                return
            }
            strongSelf.show(list: response.projects)
        }, onError: { [weak self] error in
            print(error)
            self?.showError()
        }).disposed(by: disposeBag)
    }

    private func show(list: [Project]) {
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

    private func showError() {
        presenter.hideLoading { [presenter] in
            presenter.showError()
        }
    }
}
