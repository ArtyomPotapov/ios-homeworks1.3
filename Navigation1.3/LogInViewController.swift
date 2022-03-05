//
//  LogInViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 28.02.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
        view.backgroundColor = .white
        view.addSubview(imageView)
        addConstr()
        
            }
    
    func addConstr(){
        let imageHeight = imageView.heightAnchor.constraint(equalToConstant: 100)
        let imageWidth = imageView.widthAnchor.constraint(equalToConstant: 100)
        let imageCenter = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let imageTop = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120)
        NSLayoutConstraint.activate([imageHeight, imageWidth, imageCenter, imageTop])
    }
    
    
}
