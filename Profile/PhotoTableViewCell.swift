//
//  PhotoTableViewCell.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 17.03.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    private lazy var verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    private lazy var horizontalTopStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Photos"
        photosLabel.textAlignment = .left
        photosLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        photosLabel.setContentHuggingPriority(UILayoutPriority(300), for: .horizontal)
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        return photosLabel
    }()
    
//    private lazy var arrowLabel: UILabel = {
//        let photosLabel = UILabel()
//        photosLabel.imageView = UIImage(systemName: "pencil.circle")!
//        photosLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
//        photosLabel.translatesAutoresizingMaskIntoConstraints = false
//        return photosLabel
//    }()
//
    private lazy var arrowImageView1: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: photosLabel.layer.frame.height))
        imageView.image = UIImage(systemName: "arrowshape.turn.up.right")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var myImageView1: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (self.contentView.frame.width / 4 - 48), height: 60))
        imageView.image = UIImage(named: photos[0])
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var myImageView2: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (self.contentView.frame.width / 4 - 48), height: 60))
        imageView.image = UIImage(named: photos[1])
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var myImageView3: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (self.contentView.frame.width / 4 - 48), height: 60))
        imageView.image = UIImage(named: photos[2])
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var myImageView4: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (self.contentView.frame.width / 4 - 48), height: 60))
        imageView.image = UIImage(named: photos[3])
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalTopStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalTopStackView.addArrangedSubview(photosLabel)
        horizontalTopStackView.addArrangedSubview(arrowImageView1)
        horizontalStackView.addArrangedSubview(myImageView1)
        horizontalStackView.addArrangedSubview(myImageView2)
        horizontalStackView.addArrangedSubview(myImageView3)
        horizontalStackView.addArrangedSubview(myImageView4)
        setConstraints()
    }
    
    func setConstraints(){
        let topStackView = verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        let bottomStackView = verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        let leadStackView = verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        let trailStackView = verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        
        NSLayoutConstraint.activate([topStackView, bottomStackView, trailStackView, leadStackView])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
