//
//  FeedViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit

public struct Post {
    var title: String
}

public class FeedViewController2: UIViewController {

var titlePost = Post(title: "Переданный текст")
    
    private lazy var myStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Жесты и анимация", for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(prepareToPost2), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Жёлтый VC из старой ДЗ", for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 12
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(prepareToPost), for: .touchUpInside)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Лента"
        view.addSubview(myStackView)
        myStackView.addArrangedSubview(firstButton)
        myStackView.addArrangedSubview(secondButton)
        setAllConstraints()
    }
    
    func setAllConstraints(){
        let stackCenterX = myStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let stackCenterY = myStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let firstButtonHeight = firstButton.heightAnchor.constraint(equalToConstant: 50)
        let secondButtonWidth = secondButton.widthAnchor.constraint(equalToConstant: 220)

        NSLayoutConstraint.activate([stackCenterX, stackCenterY, firstButtonHeight,secondButtonWidth ])
    }
    
    @objc func prepareToPost(){
       
    }

    @objc func prepareToPost2(){
       
    }
}
