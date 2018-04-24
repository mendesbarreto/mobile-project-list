//
// Created by douglas.barreto on 4/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

enum UIColorError: Error {
    case problemToConvertStringToHex
}

extension UIColor {
    convenience init(string: String) throws {
        let cleanString = string.replacingOccurrences(of: "#", with: "")

        guard let hex: UInt = UInt(cleanString, radix: 16) else {
            throw UIColorError.problemToConvertStringToHex
        }

        let redMask: UInt = 16
        let greenMask: UInt = 8
        let blueMask: UInt = 0

        let red = CGFloat((hex >> redMask) & 0xff) / 0xff
        let green = CGFloat((hex >> greenMask) & 0xff) / 0xff
        let blue = CGFloat((hex >> blueMask) & 0xff) / 0xff

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
