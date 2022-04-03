//
//  PhotosViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 18.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var reccc: CGRect?
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
        view.addSubview(myCollectionView)
        view.addSubview(bigImageView)
        view.addSubview(fonView)
        view.bringSubviewToFront(fonView)
        view.bringSubviewToFront(bigImageView)
        addConstr()
        setGesture()
    }
    
    func addConstr(){
        let myCollectionViewtopColl = myCollectionView.topAnchor.constraint(equalTo: view.topAnchor)
        let myCollectionViewbottomColl = myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let myCollectionViewleadingColl = myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let myCollectionViewtrailColl = myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        let fonViewtopColl = fonView.topAnchor.constraint(equalTo: view.topAnchor)
        let fonViewbottomColl = fonView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        let fonViewleadingColl = fonView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let fonViewtrailColl = fonView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topColl = bigImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        topColl?.identifier = "topColl"
        
        leadingColl = bigImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        leadingColl?.identifier = "leadingColl"
        
        widthColl = bigImageView.widthAnchor.constraint(equalToConstant: 10)
        widthColl?.identifier = "widthColl"
        
        heightColl = bigImageView.heightAnchor.constraint(equalToConstant: 10)
        heightColl?.identifier = "heightColl"        
        
        NSLayoutConstraint.activate([myCollectionViewtopColl, myCollectionViewbottomColl, myCollectionViewtrailColl, myCollectionViewleadingColl, topColl, leadingColl, widthColl, heightColl, fonViewtopColl, fonViewtrailColl, fonViewbottomColl, fonViewleadingColl].compactMap({$0}))
    }
    
    func setGesture(){
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        bigImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func handleTapGesture(_ tapGR:UITapGestureRecognizer){
        guard tapGestureRecognizer === tapGR else { return }
        guard let rrreccc = self.reccc else {return}
        print("1212121212121212")
        if isExpanded {
            isExpanded = false
            UIView.animate(withDuration: 0.1){
                self.fonView.alpha = 0
                self.bigImageView.alpha = 0
                self.topColl?.constant = rrreccc.origin.y
                self.leadingColl?.constant = rrreccc.origin.x
                self.widthColl?.constant = rrreccc.width
                self.heightColl?.constant = rrreccc.height
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
        print(frameCell)
        reccc = frameCell
        setBigImageView(indexPath: indexPath)
        addConstrBig()
    }
    
    func setBigImageView(indexPath: IndexPath){
        let image = photos[indexPath.item]
        bigImageView.image = UIImage(named: image)
    }
    
    func addConstrBig(){
        guard let rrreccc = reccc else {return}
        topColl?.constant = rrreccc.origin.y
        leadingColl?.constant = rrreccc.origin.x
        widthColl?.constant = rrreccc.width
        heightColl?.constant = rrreccc.height
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
