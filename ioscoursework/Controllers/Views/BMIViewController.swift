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
            let backgroundImage = UIImageView(image: UIImage(named: "BMI"))
                 backgroundImage.contentMode = .scaleAspectFill
                 backgroundImage.frame = view.bounds
                 view.addSubview(backgroundImage)
                 view.sendSubviewToBack(backgroundImage)
            
            self.view.addSubview(headerView)
            self.view.addSubview(heightBMI)
            self.view.addSubview(weightBMI)
            self.view.addSubview(bmiButton)
            self.view.addSubview(labelHeight)
            self.view.addSubview(labelWeight)
        
            headerView.translatesAutoresizingMaskIntoConstraints = false
            heightBMI.translatesAutoresizingMaskIntoConstraints = false
            weightBMI.translatesAutoresizingMaskIntoConstraints = false
            bmiButton.translatesAutoresizingMaskIntoConstraints = false
            labelWeight.translatesAutoresizingMaskIntoConstraints = false
            labelHeight.translatesAutoresizingMaskIntoConstraints = false
           
            NSLayoutConstraint.activate([
  
                    // headerView constraints
                   headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                
                    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    
                    // heightBMI constraints
                    heightBMI.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 170),
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
                    labelHeight.text = "\(bmi)"
            
            
            
            let heightBMI = heightBMI.text
            let weightBMI = weightBMI.text
     
            let data = [
                "heightBMI": heightBMI,
                "weightBMI": weightBMI
            ]
            
         
                databaseRef.child("bmi").childByAutoId().setValue(data){error,_ in
                    if let error = error{
                        print("Error posting data: \(error.localizedDescription)")
                    }else{
                        print("Data posted successfully")
                    }
             
                    let vc = BMIViewController()

                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: nil)
                }       }
    }
