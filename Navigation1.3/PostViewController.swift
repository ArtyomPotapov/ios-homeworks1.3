//
//  PostViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit
import StorigeService

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
