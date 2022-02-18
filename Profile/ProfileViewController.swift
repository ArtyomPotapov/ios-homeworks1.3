//
//  ProfileViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        activateConstraints()
        
        
        func activateConstraints(){
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        }
        
    }

}
