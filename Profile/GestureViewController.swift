//
//  GestureViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 24.03.2022.
//

import UIKit

class GestureViewController: UIViewController {
    
    var widthViewConstraint: NSLayoutConstraint?
    var heightViewConstraint: NSLayoutConstraint?
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var isExpanded = false
    
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    
    private lazy var myImageView: UIImageView = {
        var myImageView = UIImageView()
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "myYellow")
        view.addSubview(myImageView)
        activateConstraints()
        setImage()
        setGesture()
    }
    
    func activateConstraints(){
        topConstraint = myImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        leadingConstraint = myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        heightViewConstraint =  myImageView.heightAnchor.constraint(equalToConstant: 120)
        widthViewConstraint =  myImageView.widthAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, heightViewConstraint, widthViewConstraint].compactMap({$0}))
    }

    func setImage(){
        myImageView.image = UIImage(named: "musya")
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.cornerRadius = 60
        myImageView.clipsToBounds = true
        myImageView.layer.borderColor = UIColor.systemRed.cgColor
        myImageView.layer.borderWidth = 3
    }
  
    
    func setGesture(){
        tapGestureRecognizer.addTarget(self, action: #selector(tapView(_:)))
        myImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func tapView(_ tapGR:UITapGestureRecognizer){
        guard tapGestureRecognizer === tapGR else {return}
        
        
    }
}
