//
//  AppHomeViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-18.
//

import UIKit
import FirebaseAuth

class AppHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = false
        if Auth.auth().currentUser == nil{
            
        }
    }
}
