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

        return checkLoginAndPassword() ? true : false
        
    }
    
    func checkLoginAndPassword() -> Bool{
        if emailField.text == "a@a.ru" && passwordField.text == "12345" {
            
            return true
        } else {
            let ac = UIAlertController(title: "Ошибка!", message: "Ввведите правильный логин a@a.ru и пароль 12345", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(ac, animated: true, completion: nil)
        return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
        setView()
        addConstr()
        emailField.delegate = self
        passwordField.delegate = self
            }
    
    func setView(){
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
    }
    
    func addConstr(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            separator.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            fieldUnderEmail.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            fieldUnderEmail.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            fieldUnderEmail.topAnchor.constraint(equalTo: stackView.topAnchor),
            fieldUnderEmail.heightAnchor.constraint(equalTo: emailField.heightAnchor),
            fieldUnderPassword.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            fieldUnderPassword.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            fieldUnderPassword.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            fieldUnderPassword.heightAnchor.constraint(equalTo: passwordField.heightAnchor),
            emailField.leftAnchor.constraint(equalTo: fieldUnderEmail.leftAnchor, constant: 10),
            emailField.rightAnchor.constraint(equalTo: fieldUnderEmail.rightAnchor, constant: -10),
            passwordField.leftAnchor.constraint(equalTo: fieldUnderPassword.leftAnchor, constant: 10),
            passwordField.rightAnchor.constraint(equalTo: fieldUnderPassword.rightAnchor, constant: -10),
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            errorLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -16),
            errorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            errorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
}
