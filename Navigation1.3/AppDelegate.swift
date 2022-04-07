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
        print(#function)

        return true
    }

    
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        print(#function)
        return true
    }


    func applicationDidBecomeActive(_ application: UIApplication){
        print(#function)
        
    }

    func applicationWillResignActive(_ application: UIApplication){
        print(#function)
        
    }
    func application(_ application: UIApplication, didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation){
        print(#function)

    }
   


}

