//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import RxSwift

protocol PeopleGateway {
    func users() -> Single<[User]>
}
