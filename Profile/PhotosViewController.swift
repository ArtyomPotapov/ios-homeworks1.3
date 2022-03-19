//
//  PhotosViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var myCollectionView: UICollectionView = {
        let myCollectionView = UICollectionView(frame: .null, collectionViewLayout: layout)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.backgroundColor = .yellow
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyPhotoCell")
        return myCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Photo Gallery"
        view.addSubview(myCollectionView)
        addConstr()
        // Do any additional setup after loading the view.
    }
    
    func addConstr(){
        let topColl = myCollectionView.topAnchor.constraint(equalTo: view.topAnchor)
        let bottomColl = myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let leadingColl = myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailColl = myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        NSLayoutConstraint.activate([topColl, bottomColl, trailColl, leadingColl])
    }
}



extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPhotoCell", for: indexPath) as! MyCollectionViewCell
        cell.setImage(name: photos[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
