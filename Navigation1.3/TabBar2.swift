//
//  TabBar.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.02.2022.
//

import UIKit

public class TabBar: UITabBarController {
    let feedViewController = FeedViewController2()
    let loginViewController = LogInViewController2()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        UITabBar.appearance().barTintColor = .black
//        self.tabBar.tintColor = .label
        setNavigationControllers()
        
    }
    
    public func setNavigationControllers(){
        let firstNavigationController = UINavigationController(rootViewController: feedViewController)
        firstNavigationController.tabBarItem.title = "FEED"
//        firstNavigationController.tabBarItem.image = UIImage(systemName: "pencil.circle")!
        
        let secondNavigationController = UINavigationController(rootViewController: loginViewController)    //profileViewController)
        secondNavigationController.tabBarItem.title = "PROFILE"
//        secondNavigationController.tabBarItem.image = UIImage(systemName: "person")!
        
        
        self.viewControllers = [firstNavigationController, secondNavigationController]
    }

}
