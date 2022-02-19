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
        title = "Лента"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Пост", style:  .plain, target: self, action: #selector(prepareToPost))

    }
    
    @objc func prepareToPost(){
        let postVC = PostViewController()
        postVC.titlePost = self.titlePost.title
        navigationController?.pushViewController(postVC, animated: false)

    }

}
