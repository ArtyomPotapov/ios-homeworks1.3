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
    
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var newTextField: UITextField!
    
    var isButtonAbove = true
    var buttonTitle = "Set status"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .lightGray
        addXib()
        myPhoto.layer.cornerRadius = myPhoto.frame.size.width / 2
        myPhoto.clipsToBounds = true
        myPhoto.layer.borderColor = UIColor.white.cgColor
        myPhoto.layer.borderWidth = 3
        showStatusButton.layer.cornerRadius = 14
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.setTitleColor(.systemMint, for: .highlighted)
//
        showStatusButton.setTitle(buttonTitle, for: .normal)
        showStatusButton.setTitle(buttonTitle, for: .highlighted)

        showStatusButton.layer.shadowOpacity = 1.0
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        newTextField.layer.cornerRadius = 12
        newTextField.layer.borderWidth = 1
        newTextField.layer.borderColor = UIColor.black.cgColor
        newTextField.clipsToBounds = true
        showStatusButton.layer.zPosition = 1

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
    
    @objc func tappedButton(){
        if !isButtonAbove {
            myTextField.text = newTextField.text ?? ""
        }
        
        buttonTopConstraint.constant = isButtonAbove ? 100 : 16
            buttonTitle = isButtonAbove ? "Show status" : "Set status"
        
        UIView.animate(withDuration: 0.2) {self.layoutIfNeeded()
            
        } completion: { _ in
            self.isButtonAbove.toggle()
            self.showStatusButton.setTitle(self.buttonTitle, for: .normal)
            self.showStatusButton.setTitle(self.buttonTitle, for: .highlighted)
        }
        
    }
}
