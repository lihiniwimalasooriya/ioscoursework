//
//  UserViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-14.
//

import UIKit

class UserViewController: UIViewController {

    private let headerView = AuthHeaderView(title: "User Details", subTitle: "Sign in to your account")
        private let name = CustomTextField(fieldType: .name)
        private let age = CustomTextField(fieldType: .age)
        private let height = CustomTextField(fieldType: .height)
        private let weight = CustomTextField(fieldType: .weight)
        private let userButton = CustomButton(title: "Save", hasBackground: true, fontSize: .big)
        
                  
        override func viewDidLoad() {
            super.viewDidLoad()

            self.setupUserDetails()
            self.userButton.addTarget(self, action: #selector(didTapUser), for: .touchUpInside)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = true
        }
       
        private func setupUserDetails() {
            self.view.backgroundColor = .systemBackground
            let backgroundImage = UIImageView(image: UIImage(named: "User"))
                 backgroundImage.contentMode = .scaleAspectFill
                 backgroundImage.frame = view.bounds
                 view.addSubview(backgroundImage)
                 view.sendSubviewToBack(backgroundImage)
         
            self.view.addSubview(headerView)
            self.view.addSubview(name)
            self.view.addSubview(age)
            self.view.addSubview(height)
            self.view.addSubview(weight)
            self.view.addSubview(userButton)
            
            headerView.translatesAutoresizingMaskIntoConstraints = false
            name.translatesAutoresizingMaskIntoConstraints = false
            age.translatesAutoresizingMaskIntoConstraints = false
            height.translatesAutoresizingMaskIntoConstraints = false
            weight.translatesAutoresizingMaskIntoConstraints = false
            userButton.translatesAutoresizingMaskIntoConstraints = false
             
            NSLayoutConstraint.activate([

                headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                    // name constraints
                    name.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
                    name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    name.heightAnchor.constraint(equalToConstant: 50),

                    // age constraints
                    age.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
                    age.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    age.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    age.heightAnchor.constraint(equalToConstant: 50),

                    // height constraints
                    height.topAnchor.constraint(equalTo: age.bottomAnchor, constant: 20),
                    height.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    height.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    height.heightAnchor.constraint(equalToConstant: 50),

                    // weight constraints
                    weight.topAnchor.constraint(equalTo: height.bottomAnchor, constant: 20),
                    weight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    weight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    weight.heightAnchor.constraint(equalToConstant: 50),

                    // userButton constraints
                    userButton.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: 20),
                    userButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    userButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    userButton.heightAnchor.constraint(equalToConstant: 50),

                ])
            
            
        }
        @objc private func didTapUser() {
            
     }
    }
