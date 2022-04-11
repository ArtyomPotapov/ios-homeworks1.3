//
//  DetailDescriptionViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 27.03.2022.
//

import UIKit

class DetailDescriptionViewController: UIViewController {
    
    var numberRow: Int?
    var posts = [PostModel]()
    let window = UIWindow(frame: UIScreen.main.bounds)

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
    
    private lazy var bottomStackView: UIStackView = {
       let buttomStackView = UIStackView()
        buttomStackView.axis = .horizontal
        buttomStackView.spacing = 10
        buttomStackView.translatesAutoresizingMaskIntoConstraints = false
       return buttomStackView
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    private lazy var authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        return authorLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .systemGray3
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.isUserInteractionEnabled = true
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Детальное описание поста"
        view.backgroundColor = .white
        setView()
        addMyConstraints()
        guard let numberRow = numberRow else {return}
        setup(post: posts[numberRow])
        
    }
    
    func setView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(myImageView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(viewsLabel)
        bottomStackView.addArrangedSubview(likesLabel)
    }
    
    func addMyConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: window.frame.width),
            myImageView.heightAnchor.constraint(equalToConstant: window.frame.width),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authorLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 35),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
   
    func setup(post: PostModel){
        self.authorLabel.text = post.author
        self.viewsLabel.text = "Views: \(post.views)"
        self.likesLabel.text = "Likes: \(post.likes)"
        self.descriptionLabel.text = post.description
        self.myImageView.image = UIImage(named: "\(post.image)")
    }
}
