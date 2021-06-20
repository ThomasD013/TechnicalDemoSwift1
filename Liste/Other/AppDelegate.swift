//
//  AppDelegate.swift
//  Liste
//
//  Created by Thomas on 20/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let rootViewController = UINavigationController(rootViewController: ViewControllerProvider.Film.search)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

