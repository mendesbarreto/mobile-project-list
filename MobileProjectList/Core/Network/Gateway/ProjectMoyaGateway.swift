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

    func projects() -> Single<[Project]> {
        return provider.rx
                       .request(.projects)
                       .filterSuccessfulStatusAndRedirectCodes()
                       .map(ProjectListResponse.self)
                       .map { $0.projects }
                       .observeOn(MainScheduler.instance)
    }

    func project(byId id: String) -> Single<Project> {
        return provider.rx.request(.project(byId: id))
                          .filterSuccessfulStatusAndRedirectCodes()
                          .map(ProjectResponse.self)
                          .map { $0.project }
                          .observeOn(MainScheduler.instance)
    }
}
