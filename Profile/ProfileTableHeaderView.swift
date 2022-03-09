//
//  ProfileTableHeaderView.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 07.03.2022.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(profileHeaderView)
        activateConstraints()
//        profileHeaderView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var heightViewConstraint: NSLayoutConstraint?
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    
    
    func activateConstraints(){
        let topConstraint = profileHeaderView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = profileHeaderView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailConstraint = profileHeaderView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        heightViewConstraint =  profileHeaderView.bottomAnchor.constraint(equalTo: self.bottomAnchor)//heightAnchor.constraint(equalToConstant: 220)

        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailConstraint, heightViewConstraint].compactMap({$0}))
    }
}

extension ProfileTableHeaderView: ViewExpandable {
    func expandedView(isExpand: Bool) {
//        heightViewConstraint?.constant = isExpand ? 500 : 220
//        UIView.animate(withDuration: 0.2) {
//            self.layoutIfNeeded()
//
//        }
    }

}
