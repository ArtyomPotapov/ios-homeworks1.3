//
//  ProfileViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit
protocol ViewExpandable: AnyObject {
    func expandedView(isExpand: Bool)
}

class ProfileViewController: UIViewController {
    
    
    var heightViewConstraint: NSLayoutConstraint?
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        view.addSubview(profileHeaderView)
        activateConstraints()
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//    }
    
    func activateConstraints(){
        let topConstraint = profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailConstraint = profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        heightViewConstraint =  profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailConstraint, heightViewConstraint].compactMap({$0}))
    }
    
}

extension ProfileViewController: ViewExpandable {
    func expandedView(isExpand: Bool) {
        heightViewConstraint?.constant = isExpand ? 300 : 220
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
            print(isExpand)
            print(self.heightViewConstraint!)
        } completion: { _ in
           
        }
    }
}
