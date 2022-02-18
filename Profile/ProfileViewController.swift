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
//        view.backgroundColor = .white
        //self.navigationController.navigationBar.translucent = NO;
        //view.safeAreaLayoutGuide.owningView?.backgroundColor = .yellow
        title = "Профиль"
        view.addSubview(profileHeaderView)
        activateConstraints()
//        profileHeaderView.frame = view.frame
//        profileHeaderView.topAnchor.constraint(equalTo: navigationItem.titleView?.bottomAnchor ?? view.topAnchor).isActive = true
//        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        profileHeaderView.frame = self.view.frame
        

    }
    func activateConstraints(){
        let a = profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let b = profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let c = profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let d = profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        NSLayoutConstraint.activate([a, b, c, d])
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
//               profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//               profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//               profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//               //profileHeaderView.frame = self.view.frame
               
        
    }

}
