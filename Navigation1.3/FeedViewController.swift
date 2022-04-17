import UIKit

struct Post {
    var title: String
}

class FeedViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Лента"
        setView()
        setAllConstraints()
    }
    func setView(){
        view.addSubview(myStackView)
        myStackView.addArrangedSubview(firstButton)
        myStackView.addArrangedSubview(secondButton)
    }
    
    func setAllConstraints(){

        NSLayoutConstraint.activate([
            myStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.widthAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    @objc func prepareToPost(){
        let postVC = PostViewController()
        postVC.titlePost = self.titlePost.title
        navigationController?.pushViewController(postVC, animated: true)
    }

    @objc func prepareToPost2(){
        let postVC = GestureViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
}
