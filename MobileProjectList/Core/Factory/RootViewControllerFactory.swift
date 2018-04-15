//
// Created by douglas.barreto on 4/14/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class RootViewControllerFactory {
    static func make() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .black
        return viewController
    }
}