//
//  BMIViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-13.
//

import UIKit
import Firebase
import FirebaseDatabase

class BMIViewController: UIViewController {
    
    private let databaseRef = Database.database().reference()
    
    private let headerView = AuthHeaderView(title: "BMI Calculation", subTitle: " ")
    private let heightBMI = CustomTextField(fieldType: .heightBMI)
    private let weightBMI = CustomTextField(fieldType: .weightBMI)
    private let bmiButton = CustomButton(title: "Calculate", hasBackground: true, fontSize: .big)
    private let planButton = CustomButton(title: "Get Your Fitness Plan", hasBackground: true, fontSize: .big)
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
            self.planButton.addTarget(self, action: #selector(didTapPlan), for: .touchUpInside)        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = true
        }
       
        private func setupUserinterface() {
            self.view.backgroundColor = .systemBackground
            let backgroundImage = UIImageView(image: UIImage(named: "BMI"))
                 backgroundImage.contentMode = .scaleAspectFill
                 backgroundImage.frame = view.bounds
                 view.addSubview(backgroundImage)
                 view.sendSubviewToBack(backgroundImage)
            
            self.view.addSubview(headerView)
            self.view.addSubview(heightBMI)
            self.view.addSubview(weightBMI)
            self.view.addSubview(bmiButton)
            self.view.addSubview(planButton)
            self.view.addSubview(labelHeight)
            self.view.addSubview(labelWeight)
        
            headerView.translatesAutoresizingMaskIntoConstraints = false
            heightBMI.translatesAutoresizingMaskIntoConstraints = false
            weightBMI.translatesAutoresizingMaskIntoConstraints = false
            bmiButton.translatesAutoresizingMaskIntoConstraints = false
            planButton.translatesAutoresizingMaskIntoConstraints = false
            labelWeight.translatesAutoresizingMaskIntoConstraints = false
            labelHeight.translatesAutoresizingMaskIntoConstraints = false
           
            NSLayoutConstraint.activate([
  
                    // headerView constraints
                   headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                
                    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
                    // heightBMI constraints
                    heightBMI.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 200),
                    heightBMI.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    heightBMI.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    heightBMI.heightAnchor.constraint(equalToConstant: 50),
                    
                    // weightBMI constraints
                    weightBMI.topAnchor.constraint(equalTo: heightBMI.bottomAnchor, constant: 20),
                    weightBMI.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    weightBMI.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    weightBMI.heightAnchor.constraint(equalToConstant: 50),
                    
                    // bmiButton constraints
                    bmiButton.topAnchor.constraint(equalTo: weightBMI.bottomAnchor, constant: 20),
                    bmiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    bmiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    bmiButton.heightAnchor.constraint(equalToConstant: 50),
                    
                    // labelHeight constraints
                    labelHeight.topAnchor.constraint(equalTo: bmiButton.bottomAnchor, constant: 20),
                    labelHeight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    labelHeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
                    // labelWeight constraints
                    labelWeight.topAnchor.constraint(equalTo: labelHeight.bottomAnchor, constant: 20),
                    labelWeight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    labelWeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                // planButton constraints
                planButton.topAnchor.constraint(equalTo: labelWeight.bottomAnchor, constant: 20),
                planButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                planButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                planButton.heightAnchor.constraint(equalToConstant: 50),
                     
                ])
            
            
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
                    labelHeight.text = "Your BMI is \(bmi)"
        }
    
    @objc private func didTapPlan() {
        
      //  let vc = BMILessViewController()
        
      //  vc.modalPresentationStyle = .fullScreen
      //  self.present(vc, animated: false, completion: nil)
        
        //
        
        guard let heightString = heightBMI.text,
                  let height = Double(heightString),
                  height > 0 else {
                labelHeight.text = "Error"
                return
            }
            
            guard let weightString = weightBMI.text,
                  let weight = Double(weightString),
                  weight > 0 else {
                weightBMI.text = "Error"
                return
            }
            
            let heightInMeters = height / 100 // Convert height from centimeters to meters
            let bmi = weight / (heightInMeters * heightInMeters)
            
        if (heightBMI.text?.isEmpty == true || weightBMI.text?.isEmpty == true) && bmi == nil {
            print("Please calculate your BMI before getting your fitness plan.")
            let vc = BMIViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            } else if bmi < 20 {
                let anotherVC = BMILessViewController()
                // Configure anotherVC if needed
                self.navigationController?.pushViewController(anotherVC, animated: true)
            }
    }
}
