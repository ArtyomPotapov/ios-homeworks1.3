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

struct PostModel {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}


class ProfileViewController: UIViewController {
    
    private lazy var newButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New button from HW2.2", for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
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
        view.addSubview(newButton)
        activateConstraints()
        
    }
    
    func activateConstraints(){
        let topConstraint = profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailConstraint = profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        heightViewConstraint =  profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        let newButtonLeading = newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let newButtomTrailing = newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let newButtomBottom = newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailConstraint, heightViewConstraint, newButtomBottom, newButtonLeading, newButtomTrailing].compactMap({$0}))
    }
}

extension ProfileViewController: ViewExpandable {
    func expandedView(isExpand: Bool) {
        heightViewConstraint?.constant = isExpand ? 500 : 220
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
            print(isExpand)
            print(self.heightViewConstraint!)
        }
    }
}
