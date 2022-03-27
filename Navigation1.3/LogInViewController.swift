//
//  LogInViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 28.02.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.clipsToBounds = true
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemGray6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    private lazy var separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.backgroundColor = .lightGray
        separator.setContentHuggingPriority(.defaultHigh, for: .vertical)
        separator.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private lazy var fieldUnderEmail: UIView = {
        let fieldUnderEmail = UIView(frame: .zero)
        fieldUnderEmail.translatesAutoresizingMaskIntoConstraints = false
        return fieldUnderEmail
    }()
    
    private lazy var fieldUnderPassword: UIView = {
        let fieldUnderPassword = UIView(frame: .zero)
        fieldUnderPassword.translatesAutoresizingMaskIntoConstraints = false
        return fieldUnderPassword
    }()
    
    
    private lazy var emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email or phone"
        emailField.textColor = .black
        emailField.autocapitalizationType = .none
        emailField.font = .systemFont(ofSize: 16)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    private lazy var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.isHidden = true
        errorLabel.text = "Поля должны содержать не менее 5 символов"
        errorLabel.font = .systemFont(ofSize: 11, weight: .bold)
        errorLabel.textColor = .systemPink
        errorLabel.textAlignment = .center
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        return errorLabel
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showProfileVC), for: .touchUpInside)
        return button
    }()
    
    @objc func showProfileVC(){
        if checkText() {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
    
    func checkText() -> Bool {
        if emailField.text == "" {
            fieldUnderEmail.backgroundColor = .systemRed
            return false
        } else {
            fieldUnderEmail.backgroundColor = .none
        }
        
        if passwordField.text == "" {
            fieldUnderPassword.backgroundColor = .systemRed
            return false
        } else {
            fieldUnderPassword.backgroundColor = .none
        }
        
        if emailField.text!.count < 5 || passwordField.text!.count < 5 {
            errorLabel.isHidden = false
            return false
        } else {
            errorLabel.isHidden = true
        }
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        contentView.addSubview(button)
        stackView.addArrangedSubview(fieldUnderEmail)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(fieldUnderPassword)
        fieldUnderEmail.addSubview(emailField)
        fieldUnderPassword.addSubview(passwordField)
        contentView.addSubview(errorLabel)
        addConstr()
        emailField.delegate = self
        passwordField.delegate = self
            }
    
    func addConstr(){
        let scrollTop = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let scrollBottom = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let scrollLeft = scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let scrollRight = scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        let contentTop = contentView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        contentTop.identifier = "AaaaAAAAA"
        let contentBottom = contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        let contentXCenter = contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        let contentYCenter = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        let contentLeft = contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor)
        let contentRight = contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor)
        
        let imageHeight = imageView.heightAnchor.constraint(equalToConstant: 100)
        let imageWidth = imageView.widthAnchor.constraint(equalToConstant: 100)
        let imageCenter = imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let imageTop = imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120)
    
        let stackHeight = stackView.heightAnchor.constraint(equalToConstant: 100)
        let stackTop = stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120)
        let stackLeading = stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        let stackTrailing = stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        
        let separatorHeight = separator.heightAnchor.constraint(equalToConstant: 0.5)
        let separatorTra = separator.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0)
        let separatorLeading = separator.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0)

        let fieldUnderEmailLeading = fieldUnderEmail.leftAnchor.constraint(equalTo: stackView.leftAnchor)
        let fieldUnderEmailTrailing = fieldUnderEmail.rightAnchor.constraint(equalTo: stackView.rightAnchor)
        let fieldUnderEmailTop = fieldUnderEmail.topAnchor.constraint(equalTo: stackView.topAnchor)
        let fieldUnderEmailHeight = fieldUnderEmail.heightAnchor.constraint(equalTo: emailField.heightAnchor)
        
        let fieldUnderPasswordLeading = fieldUnderPassword.leftAnchor.constraint(equalTo: stackView.leftAnchor)
        let fieldUnderPasswordTrailing = fieldUnderPassword.rightAnchor.constraint(equalTo: stackView.rightAnchor)
        let fieldUnderPasswordBottom = fieldUnderPassword.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        let fieldUnderPasswordHeight = fieldUnderPassword.heightAnchor.constraint(equalTo: passwordField.heightAnchor)

        
        let emailLeading = emailField.leftAnchor.constraint(equalTo: fieldUnderEmail.leftAnchor, constant: 10)
        let emailTrailing = emailField.rightAnchor.constraint(equalTo: fieldUnderEmail.rightAnchor, constant: -10)
        
        let passwordLeading = passwordField.leftAnchor.constraint(equalTo: fieldUnderPassword.leftAnchor, constant: 10)
        let passwordTrailing = passwordField.rightAnchor.constraint(equalTo: fieldUnderPassword.rightAnchor, constant: -10)

        let buttonTop = button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16)
        let buttonLeading = button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        let buttonTrailing = button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        let buttonHeight = button.heightAnchor.constraint(equalToConstant: 50)
        
        
        let errorLabelBotton = errorLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -16)
        let errorLabelLeading = errorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        let errorLabelTrailing = errorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
//        let buttonHeight = button.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([scrollTop, scrollLeft, scrollRight, scrollBottom, contentTop,  contentBottom,  contentXCenter, contentYCenter, contentLeft, contentRight, imageHeight, imageWidth, imageCenter, imageTop, stackHeight, stackTop, stackLeading, stackTrailing, separatorHeight, emailLeading,  emailTrailing, separatorTra, separatorLeading, buttonTop, buttonLeading, buttonTrailing, buttonHeight, fieldUnderEmailLeading, fieldUnderEmailTrailing, fieldUnderEmailTop, fieldUnderEmailHeight, fieldUnderPasswordLeading, fieldUnderPasswordTrailing, fieldUnderPasswordBottom,  fieldUnderPasswordHeight, passwordLeading, passwordTrailing, errorLabelBotton, errorLabelLeading, errorLabelTrailing])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
}
