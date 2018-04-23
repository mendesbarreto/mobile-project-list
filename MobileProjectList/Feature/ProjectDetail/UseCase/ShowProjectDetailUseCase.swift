//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import NSObject_Rx

final class ShowProjectDetailUseCase: HasDisposeBag {

    private let projectGateway: ProjectGateway
    private let presenter: ProjectDetailPresenterInput

    init(presenter: ProjectDetailPresenterInput, projectGateway: ProjectGateway) {
        self.presenter = presenter
        self.projectGateway = projectGateway
    }

    func show(projectById id: String) {
        presenter.showLoading()
        projectGateway.project(byId: id)
                      .subscribe(onSuccess: { [weak self] project in
                          self?.show(project: project)
                      }, onError: { [presenter] _ in
                          presenter.hideLoading {
                              presenter.showError()
                          }
                      }).disposed(by: disposeBag)
    }

    private func show(project: Project) {
        presenter.hideLoading { [presenter] in
            do {
                try presenter.show(project: project)
            } catch {
                presenter.showError()
            }
        }
    }
}
