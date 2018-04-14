//
//  AppDelegate.swift
//  MobileProjectList
//
//  Created by douglas.barreto on 4/14/18.
//  Copyright © 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
#if TEST
        print("[INFO] We will run the tests now, beware")
#else
        window = MainWindowFactory.make()
#endif
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
