//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Moya

final class URLCredentialFactory {
    static func make() -> URLCredential {
        return URLCredential(user: Strings.App.apiToken, password: "", persistence: .none)
    }
}
