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
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    private lazy var myImageView: UIImageView = {
        var myImageView = UIImageView()
        myImageView.isUserInteractionEnabled = true
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        return myImageView
    }()
    
    private lazy var fonView: UIView = {
        var fonView = UIView()
        fonView.alpha = 0
        fonView.backgroundColor = UIColor(named: "myYellow")
        fonView.translatesAutoresizingMaskIntoConstraints = false
        return fonView
    }()
    
    private lazy var xCircle: UIImageView = {
        let xCircle = UIImageView()
//        xCircle.image = UIImage(systemName: "x.circle.fill")
        xCircle.tintColor = .black
        xCircle.alpha = 0
        xCircle.isUserInteractionEnabled = true
        xCircle.translatesAutoresizingMaskIntoConstraints = false
        return xCircle
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        view.addSubview(myImageView)
        view.addSubview(fonView)
        view.addSubview(xCircle)
        view.bringSubviewToFront(xCircle)
        view.bringSubviewToFront(myImageView)
        activateConstraints()
        setImage()
        setGesture()
    }
    
    func activateConstraints(){
        let fonTop = fonView.topAnchor.constraint(equalTo: view.topAnchor)
        let fonBottom = fonView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let fonTrail = fonView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let fonLeading = fonView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        
        let xCircleTop = xCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,  constant: 1)
        let xCircleTrail = xCircle.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -5)
        let xCircleWidth = xCircle.widthAnchor.constraint(equalToConstant: 35)
        let xCircleHeight = xCircle.heightAnchor.constraint(equalToConstant: 35)
        
        topConstraint = myImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        leadingConstraint = myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        heightViewConstraint =  myImageView.heightAnchor.constraint(equalToConstant: 120)
        widthViewConstraint =  myImageView.widthAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, heightViewConstraint, widthViewConstraint, fonTop, fonBottom, fonTrail, fonLeading, xCircleTop, xCircleTrail, xCircleWidth, xCircleHeight].compactMap({$0}))
    }

    func setImage(){
        myImageView.backgroundColor = .green
        myImageView.image = UIImage(named: "musya")
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.cornerRadius = 60
        myImageView.clipsToBounds = true
        myImageView.layer.borderColor = UIColor.systemRed.cgColor
        myImageView.layer.borderWidth = 3
    }
    
    func setGesture(){
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        
        myImageView.addGestureRecognizer(tapGestureRecognizer)
        
    }

    @objc func handleTapGesture(_ tapGR:UITapGestureRecognizer){
        guard tapGestureRecognizer === tapGR else { return }
        self.isExpanded.toggle()
        self.widthViewConstraint?.constant = self.isExpanded ? self.view.frame.width : 120
        self.heightViewConstraint?.constant = self.isExpanded ? self.view.frame.width : 120
        
        self.topConstraint?.constant = self.isExpanded ? (self.view.frame.height - self.view.frame.width) / 2  : 70
        self.leadingConstraint?.constant = self.isExpanded ? 0 : 20

        if isExpanded {
            xCircle.addGestureRecognizer(tapGestureRecognizer)
        } else {
            myImageView.addGestureRecognizer(tapGestureRecognizer)
        }
        
        UIView.animate(withDuration: 0.1){
            self.myImageView.layer.cornerRadius = self.isExpanded ? 0 : 60
            self.fonView.alpha = self.isExpanded ? 1 : 0
            self.xCircle.alpha = self.isExpanded ? 1 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in

        }
        
    }
    
}
