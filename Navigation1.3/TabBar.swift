//
//  TabBar.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.02.2022.
//

import UIKit

class TabBar: UITabBarController {
    let feedViewController = FeedViewController()
    let profileViewController = ProfileViewController()
    let logInViewController = LogInViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .white
        self.tabBar.tintColor = .label
        setNavigationControllers()
        
    }
    
    func setNavigationControllers(){
        let firstNavigationController = UINavigationController(rootViewController: feedViewController)
        firstNavigationController.tabBarItem.title = "FEED"
        firstNavigationController.tabBarItem.image = UIImage(systemName: "pencil.circle")!
        
        let secondNavigationController = UINavigationController(rootViewController: logInViewController)
        secondNavigationController.tabBarItem.title = "PROFILE"
        secondNavigationController.tabBarItem.image = UIImage(systemName: "person")!
        
        
        self.viewControllers = [firstNavigationController, secondNavigationController]
    }

}
