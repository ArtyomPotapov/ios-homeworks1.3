//
//  DetailDescriptionViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 27.03.2022.
//

import UIKit

class DetailDescriptionViewController: UIViewController {
    
    var numberRow: Int? 

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
        authorLabel.numberOfLines = 2
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(myImageView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(viewsLabel)
        bottomStackView.addArrangedSubview(likesLabel)
        addMyConstraints()
        guard let numberRow = numberRow else {return}
        setup(post: posts[numberRow])
        
    }
    
    
    func addMyConstraints(){
        
        let scrollTop = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let scrollBottom = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let scrollLeft = scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let scrollRight = scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        let contentTop = contentView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        let contentBottom = contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        let contentXCenter = contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        let contentYCenter = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        let contentLeft = contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
        let contentRight = contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let stackTop = stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        let stackLead = stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let stackBottom = stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        let stackTrail = stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        
        
        let imageWidth = myImageView.widthAnchor.constraint(equalToConstant: window.frame.width)
        let imageHeight = myImageView.heightAnchor.constraint(equalToConstant: window.frame.width)
        
        let authorLeading = authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let authorTrailing = authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)

        let imageLeading = myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let imageTrailing = myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        
        NSLayoutConstraint.activate([ scrollTop, scrollBottom, scrollLeft,scrollRight, contentTop, contentBottom, contentXCenter, contentYCenter, contentLeft, contentRight, stackTop, stackLead, stackTrail, stackBottom, imageWidth, imageHeight, authorLeading, imageLeading, imageTrailing, authorTrailing])
    }
   
    
    func setup(post: PostModel){
        self.authorLabel.text = post.author
        self.viewsLabel.text = "Views: " + String(post.views)
        self.likesLabel.text = "Likes: " + String(post.likes)
        self.descriptionLabel.text = post.description
        self.myImageView.image = UIImage(named: "\(post.image)")
        
    }
}
