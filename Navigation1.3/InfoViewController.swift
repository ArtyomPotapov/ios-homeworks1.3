//
//  InfoViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit

public class InfoViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        myButton()
    }
    
    public func myButton (){
      let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.setTitle("Вызвать Alert", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .blue
        button.center = view.center
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(alertContr), for: .touchUpInside)
        
    }

    @objc func alertContr(){
        let ac = UIAlertController(title: "Поздравляем!", message: "Вы опубликовали пост", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        ac.addAction(action)
        
        present(ac, animated: false, completion: nil)
    }


}
