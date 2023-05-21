//
//  ScheduleAddViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-20.
//

import UIKit
import Firebase
import FirebaseDatabase

class ScheduleAddViewController: UIViewController {

    private let databaseRef = Database.database().reference()
    
    private let headerView = AuthHeaderView(title: "Schedule Workout", subTitle: "***")
    private let planname = CustomTextField(fieldType: .name)
    //private let datePicker = CustomTextField(fieldType: .datePicker)
    private let timePicker = CustomTextField(fieldType: .timePicker)
    private let addButton = CustomButton(title: "ADD", hasBackground: true, fontSize: .big)
    
    private let datePicker = UIDatePicker()

                  
        override func viewDidLoad() {
            super.viewDidLoad()

            self.setupAddSchedule()
            self.addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = true
        }
       
        private func setupAddSchedule() {
            // Remove the line:
            self.view.addSubview(datePicker)

            // Add the following lines:
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            datePicker.datePickerMode = .date
            datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
            self.view.addSubview(datePicker)

            self.view.backgroundColor = .systemBackground
            let backgroundImage = UIImageView(image: UIImage(named: "User"))
                 backgroundImage.contentMode = .scaleAspectFill
                 backgroundImage.frame = view.bounds
                 view.addSubview(backgroundImage)
                 view.sendSubviewToBack(backgroundImage)
         
            self.view.addSubview(headerView)
            self.view.addSubview(planname)
            self.view.addSubview(datePicker)
            self.view.addSubview(timePicker)
            self.view.addSubview(addButton)
            
            headerView.translatesAutoresizingMaskIntoConstraints = false
            planname.translatesAutoresizingMaskIntoConstraints = false
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            timePicker.translatesAutoresizingMaskIntoConstraints = false
            addButton.translatesAutoresizingMaskIntoConstraints = false
             
            NSLayoutConstraint.activate([

                headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                    // name constraints
                    planname.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 280),
                    planname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    planname.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    planname.heightAnchor.constraint(equalToConstant: 50),
                
                // Remove the line:
                datePicker.topAnchor.constraint(equalTo: planname.bottomAnchor, constant: 20),
                
                    // age constraints
                    datePicker.topAnchor.constraint(equalTo: planname.bottomAnchor, constant: 20),
                    datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    datePicker.heightAnchor.constraint(equalToConstant: 50),
                
                

                // Add the following lines:
              //  datePicker.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
             //   datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               // datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
               // datePicker.heightAnchor.constraint(equalToConstant: 50),
                
                    // height constraints
                    timePicker.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
                    timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    timePicker.heightAnchor.constraint(equalToConstant: 50),
                
                    // userButton constraints
                    addButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
                    addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    addButton.heightAnchor.constraint(equalToConstant: 50),
                
                

                ])
            
            
        }
        @objc private func didTapAdd() {
            
            let name = planname.text
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let selectedDate = dateFormatter.string(from: datePicker.date)
                    let time = timePicker.text
                    
                    let data = [
                        "name": name,
                        "datePicker": selectedDate,
                        "timePicker": time
                    ]
            
         
                databaseRef.child("schedule").childByAutoId().setValue(data){error,_ in
                    if let error = error{
                        print("Error posting data: \(error.localizedDescription)")
                    }else{
                        print("Data posted successfully")
                    }
             
                    let vc = ScheduleViewController()

                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: nil)
                }
          
        }
    
    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        planname.text = selectedDate
    }
    
}
