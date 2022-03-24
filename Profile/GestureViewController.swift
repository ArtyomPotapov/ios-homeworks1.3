//
//  GestureViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 24.03.2022.
//

import UIKit

class GestureViewController: UIViewController {
    
    var widthViewConstraint: NSLayoutConstraint?
    
    private lazy var myImageView: UIImageView = {
        var myImageView = UIImageView()
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        view.addSubview(myImageView)
        activateConstraints()
        setImage()
    }
    
    func activateConstraints(){
        let topConstraint = myImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        let leadingConstraint = myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
//        let trailConstraint = myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let heightViewConstraint =  myImageView.heightAnchor.constraint(equalToConstant: 120)
        widthViewConstraint =  myImageView.widthAnchor.constraint(equalToConstant: 120)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, heightViewConstraint, widthViewConstraint].compactMap({$0}))
    }

    func setImage(){
        myImageView.image = UIImage(named: "musya")
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.cornerRadius = 60
        myImageView.clipsToBounds = true
        myImageView.layer.borderColor = UIColor.white.cgColor
        myImageView.layer.borderWidth = 3
    }
  

}
