//
// Created by douglas.barreto on 4/14/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class RootViewControllerFactory {
    static func make() -> UIViewController {
        let rootViewController = ProjectListViewController()
        rootViewController.view.backgroundColor = .white
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }
}
