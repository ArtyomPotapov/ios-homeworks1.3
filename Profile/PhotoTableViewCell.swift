//
//  PhotoTableViewCell.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 17.03.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    private lazy var myStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Photos"
        photosLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        return photosLabel
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
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
