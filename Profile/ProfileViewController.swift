//
//  ProfileViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = self.view.bounds
    }

}
