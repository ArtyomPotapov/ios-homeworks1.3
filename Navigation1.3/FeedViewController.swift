//
//  FeedViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit

struct Post {
    var title: String
}

class FeedViewController: UIViewController {

var titlePost = Post(title: "Переданный текст")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Лента"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пост", style:  .plain, target: self, action: #selector(prepareToPost))

        // Do any additional setup after loading the view.
    }
    
    @objc func prepareToPost(){
        let postVC = PostViewController()
        postVC.titlePost = self.titlePost.title
//        postVC.closure = { [weak self] in
//            guard let titleP = self?.titlePost.title else {return "Пост без заголовка"}
//            return titleP
//        }
        navigationController?.pushViewController(postVC, animated: false)
        //postVC.modalPresentationStyle = .fullScreen
        //self.present(postVC, animated: false, completion: nil)
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
