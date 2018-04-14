//
// Created by douglas.barreto on 4/14/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class MainWindowFactory {
    static func make() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = RootViewControllerFactory.make()
        window.makeKeyAndVisible()
        return window
    }
}
