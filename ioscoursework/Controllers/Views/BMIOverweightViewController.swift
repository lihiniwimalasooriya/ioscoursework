//
//  BMILessViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-19.
//

import UIKit

class BMIOverweightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupOverweight()
        self.view.backgroundColor = .systemGreen
        
    }
    
    private func setupOverweight() {
        self.view.backgroundColor = .systemBackground
        let backgroundImage = UIImageView(image: UIImage(named: "overweight"))
             backgroundImage.contentMode = .scaleAspectFill
             backgroundImage.frame = view.bounds
             view.addSubview(backgroundImage)
             view.sendSubviewToBack(backgroundImage)
    }
}
