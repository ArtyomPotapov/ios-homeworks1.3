//
//  AppDelegate.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 14.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()//frame: UIScreen.main.bounds)
        window?.rootViewController = TabBar()
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

   


}

