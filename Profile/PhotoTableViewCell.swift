//
//  PhotoTableViewCell.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 17.03.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    var photos = [String]()
    
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
        stackView.distribution = .fillEqually
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
    

    private lazy var arrowImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        imageView.setContentHuggingPriority(UILayoutPriority(400), for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var myImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: photos[0])
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var myImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: photos[1])
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var myImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: photos[2])
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var myImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: photos[3])
        imageView.contentMode = .scaleToFill
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
        addPhotos()
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
    
    func addPhotos(){
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("prikolnye_fotografii_kotov_141_foto_") {
                photos.append(item)
            }
        }
    }
    
    func setConstraints(){
        let topStackView = verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        let bottomStackView = verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        let leadStackView = verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        let trailStackView = verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        
        let myImageView1Width = myImageView1.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48))
        let myImageView1Heigth = myImageView1.heightAnchor.constraint(equalToConstant: 60)
        
        let myImageView2Width = myImageView2.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48))
        let myImageView2Heigth = myImageView2.heightAnchor.constraint(equalToConstant: 60)
        
        let myImageView3Width = myImageView3.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48))
        let myImageView3Heigth = myImageView3.heightAnchor.constraint(equalToConstant: 60)
        
        let myImageView4Width = myImageView4.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48))
        let myImageView4Heigth = myImageView4.heightAnchor.constraint(equalToConstant: 60)
        
        let arrowImageView1width = arrowImageView1.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([topStackView, bottomStackView, trailStackView, leadStackView, myImageView1Width, myImageView2Width, myImageView3Width, myImageView4Width, myImageView1Heigth, myImageView2Heigth, myImageView3Heigth, myImageView4Heigth, arrowImageView1width
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
