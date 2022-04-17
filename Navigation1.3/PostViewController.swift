import UIKit

class PostViewController: UIViewController {
    var closure: (() -> String)?
    var titlePost = "post"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = titlePost
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(showInfoVC))
    }
    
    @objc func showInfoVC(){
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }

}
