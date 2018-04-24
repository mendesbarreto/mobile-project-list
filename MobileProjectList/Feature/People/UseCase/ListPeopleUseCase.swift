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

final class ListPeopleUseCase: ListPeopleInteractor, HasDisposeBag {

    private let peopleGateway: PeopleGateway
    private let presenter: PeopleListPresenterInput

    init(peopleGateway: PeopleGateway, presenter: PeopleListPresenterInput) {
        self.peopleGateway = peopleGateway
        self.presenter = presenter
    }

    func list(byProjectId id: String) {
        presenter.showLoading()
        peopleGateway.people(byProjectId: id)
                     .subscribe(onSuccess: { [weak self] response in
                         self?.show(list: response)
                     }, onError: { [presenter] error in
                         print(error)
                         presenter.hideLoading {
                             presenter.showError()
                         }
                     }).disposed(by: disposeBag)
    }

    private func show(list: [Person]) {
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
