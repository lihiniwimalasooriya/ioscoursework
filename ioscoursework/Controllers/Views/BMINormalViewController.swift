//
//  BMINormalViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-20.
//

import UIKit

class BMINormalViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            self.setupOverweight()
            self.view.backgroundColor = .systemBackground
        }
        
    private func setupOverweight() {
            self.view.backgroundColor = .systemBackground
            
            let backgroundImage = UIImageView(image: UIImage(named: "plan"))
            backgroundImage.contentMode = .top
            backgroundImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4) // Adjust the height as per your requirements
            
            let label = UILabel()
            label.text = "You are Normal. Get your fitness plan"
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.frame = CGRect(x: 0, y: backgroundImage.frame.maxY + 16, width: view.frame.width, height: 30)
            
            view.addSubview(backgroundImage)
            view.addSubview(label)
            view.sendSubviewToBack(backgroundImage)
        
        let button = UIButton(type: .system)
                button.setTitle("Start Now", for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                button.backgroundColor = .systemBlue
                button.tintColor = .black
                button.frame = CGRect(x: view.frame.width * 0.2, y: label.frame.maxY + 16, width: view.frame.width * 0.6, height: 50)
                button.layer.cornerRadius = 8
                button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
                
                view.addSubview(backgroundImage)
                view.addSubview(label)
                view.addSubview(button)
                view.sendSubviewToBack(backgroundImage)
            }
            
            @objc private func continueButtonTapped() {
                // Handle continue button tap event
            }
}
