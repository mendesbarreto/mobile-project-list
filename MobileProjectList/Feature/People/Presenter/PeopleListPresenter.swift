//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

final class PeopleListPresenter: PeopleListPresenterInput {
    private weak var presenterOutput: PeopleListPresenterOutput?

    init(presenterOutput: PeopleListPresenterOutput? = nil) {
        self.presenterOutput = presenterOutput
    }

    func setup(presenterOutput: PeopleListPresenterOutput) {
        self.presenterOutput = presenterOutput
    }

    func showError() {
        presenterOutput?.show(alert: ErrorAlertViewModel(title: Strings.Alert.Error.title,
                                                        message: Strings.Alert.Error.message))
    }

    func showEmptyState() {
        presenterOutput?.show(alert: ErrorAlertViewModel(title: Strings.Alert.ProjectListEmpty.title,
                                                        message: Strings.Alert.ProjectListEmpty.message))
    }

    func show(list: [Person]) throws  {
        let viewModels: [PersonViewModel] = try list.map { person in
            let placeHolderImage = Assets.icPlaceHolder.image
            let name = "\(person.firstName) \(person.lastName) at: \(person.companyName)"
            let profileImageUrl = try person.avatarURL.asUrl()
            return PersonViewModel(name: .titleMediumBlack(withText: name),
                                   profileUrlImage: profileImageUrl,
                                   placeHolderImage: placeHolderImage,
                                   isAdmin: person.administrator)
        }

        presenterOutput?.show(people: viewModels)
    }

    func showLoading() {
        presenterOutput?.showLoading()
    }

    func hideLoading(onComplete: (() -> Void)?) {
        presenterOutput?.hideLoading(onComplete: onComplete)
    }
}
