//
//  UserViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-14.
//

import UIKit
import Firebase
import FirebaseDatabase

class UserViewController: UIViewController {
    
    private let databaseRef = Database.database().reference()
    
    private let headerView = AuthHeaderView(title: "User Details", subTitle: "***")
    private let name = CustomTextField(fieldType: .name)
    private let age = CustomTextField(fieldType: .age)
    private let height = CustomTextField(fieldType: .height)
    private let weight = CustomTextField(fieldType: .weight)
    private let goal = CustomTextField(fieldType: .goal)
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
            self.view.addSubview(goal)
            self.view.addSubview(userButton)
            
            headerView.translatesAutoresizingMaskIntoConstraints = false
            name.translatesAutoresizingMaskIntoConstraints = false
            age.translatesAutoresizingMaskIntoConstraints = false
            height.translatesAutoresizingMaskIntoConstraints = false
            weight.translatesAutoresizingMaskIntoConstraints = false
            goal.translatesAutoresizingMaskIntoConstraints = false
            userButton.translatesAutoresizingMaskIntoConstraints = false
             
            NSLayoutConstraint.activate([

                headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                    // name constraints
                    name.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 280),
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
                
                    // goal constraints
                    goal.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: 20),
                    goal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    goal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    goal.heightAnchor.constraint(equalToConstant: 50),
                
                    // userButton constraints
                    userButton.topAnchor.constraint(equalTo: goal.bottomAnchor, constant: 20),
                    userButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    userButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    userButton.heightAnchor.constraint(equalToConstant: 50),

                ])
            
            
        }
        @objc private func didTapUser() {
            
            let name = name.text
            let age = age.text
            let height = height.text
            let weight = weight.text
            let goal = goal.text
            let data = [
                "name": name,
                "age": age,
                "height": height,
                "weight": weight,
                "goal": goal
            ]
            
         
                databaseRef.child("users_details").childByAutoId().setValue(data){error,_ in
                    if let error = error{
                        print("Error posting data: \(error.localizedDescription)")
                    }else{
                        print("Data posted successfully")
                    }
             
                    let vc = UserViewController()

                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: nil)
                }
          
        }
    }
