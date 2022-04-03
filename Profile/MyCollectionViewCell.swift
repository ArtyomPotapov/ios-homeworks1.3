//
//  MyCollectionViewCell.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 19.03.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    private lazy var myImageView: UIImageView = {
       let myImageView = UIImageView()
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.contentMode = .scaleToFill
        myImageView.isUserInteractionEnabled = true
        return myImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        addConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConst(){
        let cenrX = myImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let cenrY = myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        let topImageView = myImageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let bottomImageView = myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        let leftImageView = myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let trailImageView = myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)

        NSLayoutConstraint.activate([cenrX, cenrY, topImageView, bottomImageView, leftImageView, trailImageView ])
    }
    
    func setImage(name: String){
        self.myImageView.image = UIImage(named: name)
    }
}
