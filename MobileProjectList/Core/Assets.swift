//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

enum Assets: String {
    case icLogo = "ic_logo"
    case icPlaceHolder = "ic_placeholder"
    case icStart = "ic_star"
    case icTask = "ic_task"

    var image: UIImage {
        return UIImage(asset: self)
    }
}

extension UIImage {
    convenience init!(asset: Assets) {
        self.init(named: asset.rawValue)
    }
}
