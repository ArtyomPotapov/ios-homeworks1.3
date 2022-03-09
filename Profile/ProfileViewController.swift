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

struct PostModel {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}


class ProfileViewController: UIViewController {
   
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
//        tableView.tableHeaderView = ProfileTableHeaderView()
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        
//        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.addSubview(tableView)
        addConstraint()
    }
   
    func addConstraint(){
        let tableTop = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let tableBottom = tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        let tableLeft = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let tableTrailing = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        NSLayoutConstraint.activate([tableTop, tableLeft, tableBottom, tableTrailing])
    }
    
}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count 
    }
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        <#code#>

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//
//             let cell = UITableViewCell()
//            let view = ProfileTableHeaderView()
//            cell.contentView.addSubview(view)
//            view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
//            view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
//            view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
//            view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
//            view.heightAnchor.constraint(equalToConstant: 220).isActive = true
//            return cell
//        }
//        else {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let post = posts[indexPath.row ]
        cell.setup(post: post)
        return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileTableHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
}
