//
//  InfoViewController.swift
//  Navigation1.3
//
//  Created by Artyom Potapov on 15.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        myButton()
        // Do any additional setup after loading the view.
    }
    func myButton (){
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
        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(ac, animated: false, completion: nil)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
