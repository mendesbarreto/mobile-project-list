//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import RxMoya
import Moya

class PeopleMoyaGateway: PeopleGateway {
    let provider: MoyaProvider<PeopleTarget>

    init() {
        provider = MoyaProvider<PeopleTarget>(plugins: [NetworkLoggerPlugin(verbose: true), CredentialsPlugin {  _ -> URLCredential? in
            return URLCredentialFactory.make()
        }])
    }

    func people() -> Single<[Person]> {
        return request(target: .people)
    }

    func people(byProjectId projectId: String) -> Single<[Person]> {
        return request(target: .peopleByProject(id: projectId))
    }

    private func request(target: PeopleTarget) -> Single<[Person]> {
        return provider.rx.request(target)
                          .filterSuccessfulStatusAndRedirectCodes()
                          .map(PeopleResponse.self)
                          .map { return $0.people }
                          .observeOn(MainScheduler.instance)
    }
}
