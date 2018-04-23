//
// Created by douglas.barreto on 4/23/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxMoya
import RxSwift

protocol TaskGateway {
    func tasks(byProjectId: String) -> Single<[TaskModel]>
}
