//
// Created by douglas.barreto on 4/20/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import Foundation

enum StringUrlError: Error {
    case problemToConvertStringInUrl
}

extension String {
    func asUrl() throws -> URL {
        guard let url = try URL(string: self) else {
            throw StringUrlError.problemToConvertStringInUrl
        }
        return url
    }
}
