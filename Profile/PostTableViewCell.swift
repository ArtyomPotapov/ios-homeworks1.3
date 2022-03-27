//
//  PostTableViewCell.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 07.03.2022.
//

import UIKit
protocol AddLikesDelegate {
    func addLikes(cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
    
    let tapLikes = UITapGestureRecognizer()
    var delegate: AddLikesDelegate?

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(myImageView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(viewsLabel)
        bottomStackView.addArrangedSubview(likesLabel)
        addMyConstraints()
        likesLabel.addGestureRecognizer(tapLikes)
        tapLikes.addTarget(self, action: #selector(addLikes))

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addMyConstraints(){
        let window = UIWindow(frame: UIScreen.main.bounds)
        let stackTop = stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        let stackLead = stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let stackBottom = stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        let stackTrail = stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let imageWidth = myImageView.widthAnchor.constraint(equalToConstant: window.frame.width)
        let imageHeight = myImageView.heightAnchor.constraint(equalToConstant: window.frame.width)
        let authorLeding = authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let imageLeading = myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let imageTrailing = myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let authorTrailing = authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        NSLayoutConstraint.activate([stackTop, stackLead, stackTrail, stackBottom, imageWidth, imageHeight, authorLeding, imageLeading, imageTrailing, authorTrailing])
    }
    
    func setup(post: PostModel){
        self.authorLabel.text = post.author
        let totalLikes = post.views
        self.viewsLabel.text = "Views: " + String(totalLikes)
        self.likesLabel.text = "Likes: " + String(post.likes)
        self.descriptionLabel.text = post.description
        self.myImageView.image = UIImage(named: "\(post.image)")
        
    }
    
    @objc func addLikes(){
        guard let newCount = Int((self.likesLabel.text!.dropFirst(7))) else {return}
        self.likesLabel.text = "Likes: " + String(newCount + 1)
        delegate?.addLikes(cell: self)
        layoutIfNeeded()

    }
    
    
}
