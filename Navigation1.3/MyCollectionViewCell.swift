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
        NSLayoutConstraint.activate([
            myImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
    }
    
    func setImage(name: String){
        self.myImageView.image = UIImage(named: name)
    }
}
