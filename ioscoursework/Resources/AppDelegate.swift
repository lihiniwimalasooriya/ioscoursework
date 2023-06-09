//
//  AppDelegate.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-07.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let  window = UIWindow(frame: UIScreen.main.bounds)
        
        let navVC = UINavigationController(rootViewController: WelcomeViewController())
        navVC.navigationBar.prefersLargeTitles = true
        navVC.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
        window.rootViewController = navVC
              
        window.makeKeyAndVisible()
        self.window = window
        
        FirebaseApp.configure()
        
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

