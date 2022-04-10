//
//  ProfileViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit


protocol ViewExpandable: AnyObject {
    func expandedView(isExpand: Bool)
}

protocol Qwe: AnyObject {
    func qwe()
    
}


class ProfileViewController: UIViewController, AddLikesDelegate {
    var height: CGFloat = 400
    var heightHeader = true
    var posts = [PostModel]()
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
        fonView.backgroundColor = .white
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
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.addSubview(tableView)
        posts = postsAll
        
        view.addSubview(myImageView)
        view.addSubview(fonView)
        view.addSubview(xCircle)
        view.bringSubviewToFront(fonView)
        view.bringSubviewToFront(xCircle)
        view.bringSubviewToFront(myImageView)
        setImage()
        addConstraint()
        
        setGesture()
    }
   
    func setImage(){
        myImageView.alpha = 0
        myImageView.image = UIImage(named: "musya")
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.cornerRadius = 60
        myImageView.clipsToBounds = true
        myImageView.layer.borderColor = UIColor.white.cgColor
        myImageView.layer.borderWidth = 3
    }
    
    func addConstraint(){
        
        topConstraint = myImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingConstraint = myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        heightViewConstraint =  myImageView.heightAnchor.constraint(equalToConstant: 120)
        widthViewConstraint =  myImageView.widthAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topConstraint,
            leadingConstraint,
            heightViewConstraint,
            widthViewConstraint,
            fonView.topAnchor.constraint(equalTo: view.topAnchor),
            fonView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            xCircle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,  constant: 1),
            xCircle.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -5),
            xCircle.widthAnchor.constraint(equalToConstant: 35),
            xCircle.heightAnchor.constraint(equalToConstant: 35)
        ].compactMap({$0}))
        
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
            self.myImageView.alpha = self.isExpanded ? 1 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in

        }
    }
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1   {
            return postsAll.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1   {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell  else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            let post = posts[indexPath.row ]
            cell.setup(post: post)
            cell.delegate = self
            return cell
        } else {
            let cell = PhotoTableViewCell(style: .default, reuseIdentifier: "PhotoCell")
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
        let header = ProfileTableHeaderView()
        header.delegate = self
        header.delegatePVC = self
            
        return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
        return 280
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = PhotosViewController()
            navigationController?.pushViewController(vc, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
        } else {
            posts[indexPath.row].views += 1
            tableView.reloadRows(at: [indexPath], with: .none)
            let vc = DetailDescriptionViewController()
            vc.numberRow = indexPath.row
            vc.posts = posts
            navigationController?.pushViewController(vc, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    func addLikes(cell: PostTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        posts[indexPath.row].likes += 1
    }
    
}

extension ProfileViewController: Qwe {
    
        func qwe(){
            print("1234567890")
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
                self.myImageView.alpha = self.isExpanded ? 1 : 0
                self.view.layoutIfNeeded()
            } completion: { _ in

            }
        }
    
}
