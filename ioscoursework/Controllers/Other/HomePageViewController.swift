//
//  HomePageViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-12.
//

import UIKit

class HomePageViewController: UIViewController {
    
    private let bmiImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "BMI" )
        iv.tintColor = .white
        return iv
    } ()
    
    private let headerView = AuthHeaderView(title: "BMI Calculation", subTitle: "Sign in to your account")
    private let heightBMI = CustomTextField(fieldType: .heightBMI)
    private let weightBMI = CustomTextField(fieldType: .weightBMI)
    private let bmiButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUserinterface()
        self.bmiButton.addTarget(self, action: #selector(didTapBMI), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
   
    private func setupUserinterface() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(bmiImg)
        self.view.addSubview(headerView)
        self.view.addSubview(heightBMI)
        self.view.addSubview(weightBMI)
        self.view.addSubview(bmiButton)
        
        bmiImg.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        heightBMI.translatesAutoresizingMaskIntoConstraints = false
        weightBMI.translatesAutoresizingMaskIntoConstraints = false
        bmiButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    @objc private func didTapBMI() {
        
       // @IBAction func calculateBMI(_ sender: UIButton) {
        guard let heightString = heightBMI, let height = Double(heightString), heightBMI> 0 else { heightBMI = "Error" height.text = "Error" return
        guard let weightString = weightBMI.text, let weight = Double(weightString), weight > 0 else { weightBMI = "Error" weightBMI = "Error" return
            
        // Perform BMI calculation and display the results
        let bmi = weight / (height * height) height.text = "Your BMI:" weight.text = "\(bmi)"
    }
    
}

