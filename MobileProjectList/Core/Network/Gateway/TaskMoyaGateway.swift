//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//
import Moya
import RxMoya
import RxSwift

final class TaskMoyaGateway: TaskGateway {

    private let provider: MoyaProvider<TaskTarget>

    init() {
        provider = MoyaProvider<TaskTarget>(plugins: [NetworkLoggerPlugin(verbose: true), CredentialsPlugin {  _ -> URLCredential? in
            return URLCredentialFactory.make()
        }])
    }

    func tasks(byProjectId id: String) -> RxSwift.Single<[TaskModel]> {
        return provider.rx.request(.tasks(byProjectId: id))
                   .filterSuccessfulStatusAndRedirectCodes()
                   .map(TaskListResponse.self)
                   .map { $0.tasks }
                   .observeOn(MainScheduler.instance)
    }
}
