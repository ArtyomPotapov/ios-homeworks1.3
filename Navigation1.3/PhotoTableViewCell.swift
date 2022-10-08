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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setConstraints()
    }
    
    func setView(){
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalTopStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalTopStackView.addArrangedSubview(photosLabel)
        horizontalTopStackView.addArrangedSubview(arrowImageView1)
        horizontalStackView.addArrangedSubview(myImageView1)
        horizontalStackView.addArrangedSubview(myImageView2)
        horizontalStackView.addArrangedSubview(myImageView3)
        horizontalStackView.addArrangedSubview(myImageView4)
    }
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            myImageView1.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48)),
            myImageView1.heightAnchor.constraint(equalToConstant: 60),
            myImageView2.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48)),
            myImageView2.heightAnchor.constraint(equalToConstant: 60),
            myImageView3.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48)),
            myImageView3.heightAnchor.constraint(equalToConstant: 60),
            myImageView4.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width / 4 - 48)),
            myImageView4.heightAnchor.constraint(equalToConstant: 60),
            arrowImageView1.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
