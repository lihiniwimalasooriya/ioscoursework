//
//  LoginViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-12.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController  {
        
    public var compeletionHandler: ((Bool) -> Void)?
    
        private let databaseRef = Database.database().reference()

        private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your Account")
        
        private let emailField = CustomTextField(fieldType: .email)
        private let passwordField = CustomTextField(fieldType: .password)
    
        private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
        private let newUserButton = CustomButton(title: "New User? Create Account.", fontSize: .med)
        private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize: .small)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupUI()
            
            self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
         //   self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
          //  self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = true
        }
        
        // UI Setup
        private func setupUI() {
            self.view.backgroundColor = .systemBackground
            
            self.view.addSubview(headerView)
            self.view.addSubview(emailField)
            self.view.addSubview(passwordField)
            self.view.addSubview(signInButton)
            self.view.addSubview(newUserButton)
            self.view.addSubview(forgotPasswordButton)
            
            headerView.translatesAutoresizingMaskIntoConstraints = false
            emailField.translatesAutoresizingMaskIntoConstraints = false
            passwordField.translatesAutoresizingMaskIntoConstraints = false
            signInButton.translatesAutoresizingMaskIntoConstraints = false
            newUserButton.translatesAutoresizingMaskIntoConstraints = false
            forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
                self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.headerView.heightAnchor.constraint(equalToConstant: 222),
                
                self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
                self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.emailField.heightAnchor.constraint(equalToConstant: 55),
                self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
                self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.passwordField.heightAnchor.constraint(equalToConstant: 55),
                self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
                self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.signInButton.heightAnchor.constraint(equalToConstant: 55),
                self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
                self.newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
                self.newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
                self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
                
       //         self.forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 6),
        //        self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
         //       self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
         //       self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            ])
        }
        
    @objc private func didTapSignIn() {
                
                    let usersRef = Database.database().reference().child("users")
                    let enteredUsername = emailField.text
                    let enteredPassword = passwordField.text

                    usersRef.observeSingleEvent(of: .value) { snapshot in
                        if let usersData = snapshot.value as? [String: Any] {
                            for (_, userData) in usersData {
                                if let userDict = userData as? [String: Any],
                                   let username = userDict["username"] as? String,
                                   let password = userDict["password"] as? String {
                                    print(username)
                                    print(password)
                                    if username == enteredUsername && password == enteredPassword {
                                        
                                        // User authentication successful
                                        let vc = TabBarViewController()

                                        vc.modalPresentationStyle = .fullScreen
                                        self.present(vc, animated: false, completion: nil)
                                        print("Authentication successful")
                                        
                                        // Perform actions such as navigating to the next screen
                                        return
                                    }
                                }
                            }
                            
                            // User authentication failed
                            print("Authentication failed")
                            // Display an error message or perform any other necessary actions
                        }
                    }
                    
                   
                
            }
     //   @objc private func didTapNewUser() {
      //      let vc = RegisterViewController()
     //       self.navigationController?.pushViewController(vc, animated: true)
     //   }
        
     //   @objc private func didTapForgotPassword() {
      //      let vc = ForgetPwdViewController()
        //    self.navigationController?.pushViewController(vc, animated: true)
       // }
    }
