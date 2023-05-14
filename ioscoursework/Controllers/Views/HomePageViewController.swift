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
    
    private let headerView = AuthHeaderView(title: "BMI Calculation", subTitle: "***")
    private let heightBMI = CustomTextField(fieldType: .heightBMI)
    private let weightBMI = CustomTextField(fieldType: .weightBMI)
    private let bmiButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let labelHeight: UILabel = {
            let labelHeight = UILabel()
            labelHeight.textAlignment = .center
            labelHeight.text = ""
            labelHeight.font = UIFont.boldSystemFont(ofSize: 20)
            labelHeight.textColor = .black
            
            return labelHeight
        }()
    private let labelWeight: UILabel = {
            let labelWeight = UILabel()
            labelWeight.textAlignment = .center
            labelWeight.text = ""
            labelWeight.font = UIFont.boldSystemFont(ofSize: 20)
            labelWeight.textColor = .black
            
            return labelWeight
        }()
    
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
        self.view.addSubview(labelHeight)
        self.view.addSubview(labelWeight)
        
        bmiImg.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        heightBMI.translatesAutoresizingMaskIntoConstraints = false
        weightBMI.translatesAutoresizingMaskIntoConstraints = false
        bmiButton.translatesAutoresizingMaskIntoConstraints = false
        labelWeight.translatesAutoresizingMaskIntoConstraints = false
        labelHeight.translatesAutoresizingMaskIntoConstraints = false
        
    }
    @objc private func didTapBMI() {
        
        guard let heightString = heightBMI.text,
                         let height = Double(heightString),
                         height > 0 else {
                       //height.text = "Error"
                       labelHeight.text = "Error"
                       return
                   }
                   
                   guard let weightString = weightBMI.text,
                         let weight = Double(weightString),
                         weight > 0 else {
                      // label1.text = "Error"
                       weightBMI.text = "Error"
                       return
                       
                   }
                let heightInMeters = height / 100 // Convert height from centimeters to meters
                let bmi = weight / (heightInMeters * heightInMeters)
                    
                    // Display or use the calculated BMI value
                labelHeight.text = "\(bmi)"
            }
}

