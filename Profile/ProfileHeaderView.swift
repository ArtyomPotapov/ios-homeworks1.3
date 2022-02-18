//
//  PrifileHeaderView.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    @IBOutlet weak var myPhoto: UIImageView!
    @IBOutlet weak var showStatusButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        addXib()
        myPhoto.layer.cornerRadius = myPhoto.frame.size.width / 2
        myPhoto.clipsToBounds = true
        myPhoto.layer.borderColor = UIColor.white.cgColor
        myPhoto.layer.borderWidth = 3
        showStatusButton.layer.cornerRadius = 14
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.setTitleColor(.systemMint, for: .highlighted)
//
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitle("Show status", for: .highlighted)

        showStatusButton.layer.shadowOpacity = 1.0
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addXib()
    }
    
    func addXib(){
       let bundle = Bundle.init(for: ProfileHeaderView.self)
           if let myView = bundle.loadNibNamed("View", owner: self, options: nil)?.first as? UIView {
           addSubview(myView)
               myView.frame = self.frame
               myView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       }
        
    }
}
