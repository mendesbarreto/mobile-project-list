//
// Created by douglas.barreto on 4/15/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import Moya
import RxMoya
import RxSwift

final class PeopleViewController: BaseViewController {

    let peopleGateway = MoyaProvider<PeopleTarget>(plugins: [NetworkLoggerPlugin(verbose: true), CredentialsPlugin {  _ -> URLCredential? in
        return URLCredential(user: Strings.App.apiToken, password: "", persistence: .none)
    }])

    override func viewDidLoad() {
        super.viewDidLoad()
        peopleGateway.rx.request(.people)
                        .filterSuccessfulStatusAndRedirectCodes().subscribe(onSuccess: { response in
                            print(response)
                        }, onError: { error in
                            print(error)
                        })
    }
}
