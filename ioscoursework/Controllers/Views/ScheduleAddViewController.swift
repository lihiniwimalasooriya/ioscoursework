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
    private let planname = CustomTextField(fieldType: .planname)
    private let datePickerLabel = CustomTextField(fieldType: .datePicker)
    private let datePicker = UIDatePicker()
    private let timePickerLabel = CustomTextField(fieldType: .timePicker)
    private let timePicker = UIDatePicker()
    private let addButton = CustomButton(title: "Add", hasBackground: true, fontSize: .big)
    private let myButton = CustomButton(title: "My Schedule", hasBackground: true, fontSize: .big)
    
        override func viewDidLoad() {
            super.viewDidLoad()

            self.setupAddSchedule()
            self.addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
            self.myButton.addTarget(self, action: #selector(didTapMy), for: .touchUpInside)        }
        
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
            
            timePicker.addTarget(self, action: #selector(timePickerValueChanged), for: .valueChanged)
            
            self.view.backgroundColor = .systemBackground
            //let backgroundImage = UIImageView(image: UIImage(named: "schedule"))
            //     backgroundImage.contentMode = .scaleAspectFill
            //     backgroundImage.frame = view.bounds
            //     view.addSubview(backgroundImage)
            //     view.sendSubviewToBack(backgroundImage)
         
            self.view.addSubview(headerView)
            self.view.addSubview(planname)
            self.view.addSubview(datePicker)
            self.view.addSubview(timePicker)
            self.view.addSubview(addButton)
            self.view.addSubview(myButton)
            
            headerView.translatesAutoresizingMaskIntoConstraints = false
            planname.translatesAutoresizingMaskIntoConstraints = false
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            timePicker.translatesAutoresizingMaskIntoConstraints = false
            addButton.translatesAutoresizingMaskIntoConstraints = false
            myButton.translatesAutoresizingMaskIntoConstraints = false
             
            NSLayoutConstraint.activate([

                    // headerView constraints
                    headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                    // name constraints
                    planname.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 280),
                    planname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    planname.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    planname.heightAnchor.constraint(equalToConstant: 50),
                
                    // datePicker constraints
                    datePicker.topAnchor.constraint(equalTo: planname.bottomAnchor, constant: 20),
                    datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    datePicker.heightAnchor.constraint(equalToConstant: 50),
                
                    // time constraints
                    timePicker.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
                    timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    timePicker.heightAnchor.constraint(equalToConstant: 50),
                
                    // addButton constraints
                    addButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
                    addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    addButton.heightAnchor.constraint(equalToConstant: 50),
                
                    // myButton constraints
                    myButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),
                    myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    myButton.heightAnchor.constraint(equalToConstant: 50),
                ])
        }
    
        @objc private func didTapAdd() {
            
            let name = planname.text
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let selectedDate = dateFormatter.string(from: datePicker.date)
                let time = timePicker.date
                
                let data = [
                    "name": name,
                    "datePicker": selectedDate,
                    "timePicker": time
                ] as [String : Any]
                
                databaseRef.child("schedule").childByAutoId().setValue(data) { error, _ in
                    if let error = error {
                        print("Error posting data: \(error.localizedDescription)")
                    } else {
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
        datePickerLabel.text = selectedDate
    }
    
    @objc private func timePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let selectedTime = dateFormatter.string(from: timePicker.date)
        timePickerLabel.text = selectedTime
    }
    
    @objc private func didTapMy() {
        
        let VC = ScheduleViewController()
        // Configure anotherVC if needed
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
