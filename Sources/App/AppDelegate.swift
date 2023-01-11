//
//  AppDelegate.swift
//  WidgetKit_Sample
//
//  Created by Osman Yıldırım
//

import UIKit
import Drops
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewControllerCreator.create()
        window?.makeKeyAndVisible()

        IQKeyboardManager.shared.enable = true

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let drop = Drop(title: "Depplink Opened", subtitle: url.absoluteString, icon: UIImage(systemName: "checkmark.seal.fill"))
        Drops.show(drop)
        return true
    }
}
