//
//  TabBar.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.02.2022.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        let feedViewController = FeedViewController()
        let firstNavigationController = UINavigationController(rootViewController: feedViewController)
        firstNavigationController.tabBarItem.title = "FEED"
        firstNavigationController.tabBarItem.image = UIImage(systemName: "pencil.circle")!
        
        let profileViewController = ProfileViewController()
        let secondNavigationController = UINavigationController(rootViewController: profileViewController)
        secondNavigationController.tabBarItem.title = "PROFILE"
        secondNavigationController.tabBarItem.image = UIImage(systemName: "person")!
        
        self.viewControllers = [firstNavigationController, secondNavigationController]
        UITabBar.appearance().barTintColor = .systemBackground
        self.tabBar.tintColor = .label
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
