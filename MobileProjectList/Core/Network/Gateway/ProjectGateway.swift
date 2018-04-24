//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

protocol ProjectGateway {
    func projects() -> Single<[Project]>
    func project(byId: String) -> Single<Project>
}
