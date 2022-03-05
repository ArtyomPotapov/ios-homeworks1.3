//
//  LogInViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 28.02.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
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
    
    private lazy var emailField: UITextField = {
        let emailField = UITextField()
        emailField.backgroundColor = .systemGray6
        emailField.placeholder = "Email or phone"
        emailField.textColor = .black
        emailField.autocapitalizationType = .none
        emailField.font = .systemFont(ofSize: 16)
//        emailField.tintColor =
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.backgroundColor = .systemGray6
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(passwordField)
        addConstr()
        
            }
    
    func addConstr(){
        let imageHeight = imageView.heightAnchor.constraint(equalToConstant: 100)
        let imageWidth = imageView.widthAnchor.constraint(equalToConstant: 100)
        let imageCenter = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let imageTop = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120)
        let stackHeight = stackView.heightAnchor.constraint(equalToConstant: 100)
        let stackTop = stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120)
        let stackLeading = stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        let stackTrailing = stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        let separatorHeight = separator.heightAnchor.constraint(equalToConstant: 0.5)
        let separatorWidth = separator.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0)
        let emailLeading = emailField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10)
        
        
        NSLayoutConstraint.activate([imageHeight, imageWidth, imageCenter, imageTop, stackHeight, stackTop, stackLeading, stackTrailing, separatorWidth, separatorHeight, emailLeading])
    }
    
    
}
