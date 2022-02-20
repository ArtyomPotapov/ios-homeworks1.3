//
//  PrifileHeaderView.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var showStatusButton: UIButton!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var setStatusTextField: UITextField!
    
    
    
    private var isButtonAbove = true
    private var buttonTitle = "Set status"
    var delegate: ViewExpandable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addXib()
        setMyPhoto()
        setshowStatusButton()
        setnewTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addXib()
    }
    
    private func addXib(){
       let bundle = Bundle.init(for: ProfileHeaderView.self)
           if let myView = bundle.loadNibNamed("View", owner: self, options: nil)?.first as? UIView {
           addSubview(myView)
               myView.frame = self.frame
               myView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       }
    }
    
    private func setMyPhoto(){
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
    }
    
    private func setshowStatusButton(){
        showStatusButton.layer.cornerRadius = 14
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.setTitleColor(.systemMint, for: .highlighted)
        showStatusButton.setTitle(buttonTitle, for: .normal)
        showStatusButton.setTitle(buttonTitle, for: .highlighted)
        showStatusButton.layer.shadowOpacity = 1.0
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        showStatusButton.layer.zPosition = 1

    }
    
    private func setnewTextField(){
        setStatusTextField.layer.cornerRadius = 12
        setStatusTextField.layer.borderWidth = 1
        setStatusTextField.layer.borderColor = UIColor.black.cgColor
        setStatusTextField.clipsToBounds = true
    }
    
    @objc func tappedButton(){
        if !isButtonAbove {
            statusTextField.text = setStatusTextField.text ?? ""
        }
        
        buttonTopConstraint.constant = isButtonAbove ? 100 : 16
        buttonTitle = isButtonAbove ? "Show status" : "Set status"
            self.delegate?.expandedView(isExpand: self.isButtonAbove)
            self.isButtonAbove.toggle()
            self.showStatusButton.setTitle(self.buttonTitle, for: .normal)
            self.showStatusButton.setTitle(self.buttonTitle, for: .highlighted)
            
    }
}
