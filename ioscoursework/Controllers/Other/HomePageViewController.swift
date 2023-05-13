//
//  HomePageViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-12.
//

import UIKit

class HomePageViewController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "BMI Calculation", subTitle: "Sign in to your account")
    private let height = CustomTextField(fieldType: .height)
    private let weight = CustomTextField(fieldType: .weight)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUserinterface()
   
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
   
    private func setupUserinterface() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(height)
        self.view.addSubview(weight)
  
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        height.translatesAutoresizingMaskIntoConstraints = false
        weight.translatesAutoresizingMaskIntoConstraints = false
       
    }
    
  
}

