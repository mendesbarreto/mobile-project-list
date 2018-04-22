//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift
import RxMoya
import Moya

final class ProjectMoyaGateway: ProjectGateway {
    private let provider: MoyaProvider<ProjectTarget>

    init() {
        provider = MoyaProvider<ProjectTarget>(plugins: [NetworkLoggerPlugin(verbose: true), CredentialsPlugin {  _ -> URLCredential? in
            return URLCredentialFactory.make()
        }])
    }
    func projects() -> Single<ProjectResponse> {
        return provider.rx
                       .request(.projects)
                       .debug()
                       .filterSuccessfulStatusAndRedirectCodes()
                       .debug()
                       .map(ProjectResponse.self)
                       .debug()
                       .observeOn(MainScheduler.instance)
    }
}
