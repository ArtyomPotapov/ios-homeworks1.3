//
//  PhotosViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var rectOfCell: CGRect?
    var topColl: NSLayoutConstraint?
    var leadingColl: NSLayoutConstraint?
    var widthColl: NSLayoutConstraint?
    var heightColl: NSLayoutConstraint?
    var tapGestureRecognizer = UITapGestureRecognizer()
    var isExpanded = false

    
    private lazy var bigImageView: UIImageView = {
        let bigImageView = UIImageView()
        bigImageView.alpha = 0
        bigImageView.backgroundColor = .red
        bigImageView.isUserInteractionEnabled = true
        bigImageView.translatesAutoresizingMaskIntoConstraints = false
        return bigImageView
    }()
    
    private lazy var fonView: UIView = {
        var fonView = UIView()
        fonView.alpha = 0
        fonView.backgroundColor = .white
        fonView.translatesAutoresizingMaskIntoConstraints = false
        return fonView
    }()
    
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
        myCollectionView.backgroundColor = .white
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyPhotoCell")
        return myCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        setView()
        addConstr()
        setGesture()
    }
    
    func setView(){
        view.addSubview(myCollectionView)
        view.addSubview(bigImageView)
        view.addSubview(fonView)
        view.bringSubviewToFront(fonView)
        view.bringSubviewToFront(bigImageView)
    }
    
    func addConstr(){
        topColl = bigImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        topColl?.identifier = "topColl"
        leadingColl = bigImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        leadingColl?.identifier = "leadingColl"
        widthColl = bigImageView.widthAnchor.constraint(equalToConstant: 10)
        widthColl?.identifier = "widthColl"
        heightColl = bigImageView.heightAnchor.constraint(equalToConstant: 10)
        heightColl?.identifier = "heightColl"        
        
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fonView.topAnchor.constraint(equalTo: view.topAnchor),
            fonView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topColl, leadingColl, widthColl, heightColl
        ].compactMap({$0}))
    }
    
    func setGesture(){
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        bigImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func handleTapGesture(_ tapGR:UITapGestureRecognizer){
        guard tapGestureRecognizer === tapGR else { return }
        guard let tempRectOfCell = self.rectOfCell else {return}
        if isExpanded {
            isExpanded = false
            UIView.animate(withDuration: 0.1){
                self.fonView.alpha = 0
                self.bigImageView.alpha = 0
                self.topColl?.constant = tempRectOfCell.origin.y
                self.leadingColl?.constant = tempRectOfCell.origin.x
                self.widthColl?.constant = tempRectOfCell.width
                self.heightColl?.constant = tempRectOfCell.height
                self.view.layoutIfNeeded()
            }
        }
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
        let widthAndHeight = floor((collectionView.frame.width - 16) / 3)
        let cgSize = CGSize(width: widthAndHeight, height: widthAndHeight)
        return cgSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        guard let frameCell = cell?.frame else { return  }
        rectOfCell = frameCell
        setBigImageView(indexPath: indexPath)
        addConstrBig()
    }
    
    func setBigImageView(indexPath: IndexPath){
        let image = photos[indexPath.item]
        bigImageView.image = UIImage(named: image)
    }
    
    func addConstrBig(){
        guard let rectCell = rectOfCell else {return}
        topColl?.constant = rectCell.origin.y
        leadingColl?.constant = rectCell.origin.x
        widthColl?.constant = rectCell.width
        heightColl?.constant = rectCell.height
        self.view.layoutIfNeeded()
        self.isExpanded = true
        UIView.animate(withDuration: 0.2) {
            self.bigImageView.alpha = 1
            self.fonView.alpha = 1
            self.widthColl?.constant =  self.view.frame.width
            self.heightColl?.constant = self.view.frame.width
            self.topColl?.constant = (self.view.frame.height - self.view.frame.width) / 2 - 50
            self.leadingColl?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
