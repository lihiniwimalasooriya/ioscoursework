//
//  ScheduleViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-20.
//

import UIKit
import Firebase
import FirebaseDatabase

class ScheduleViewController: UIViewController, UITableViewDataSource {
    
    private let headerView = AuthHeaderView(title: "Scheduled Workouts", subTitle: "***")
    private let addButton = CustomButton(title: "ADD", hasBackground: true, fontSize: .big)
    
            var tableView: UITableView!
            var databaseRef: DatabaseReference!
            var dataSource: [Schedule] = []
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                // Initialize Firebase Database reference
                databaseRef = Database.database().reference()
                
                // Load data from Firebase
                loadDataFromFirebase()
                
                // Register custom cell
                tableView = UITableView(frame: view.bounds, style: .plain)
                tableView.dataSource = self
              
                tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
                view.addSubview(tableView)
                
                self.setupAddSchedule()
               // self.addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
                
            }
    
    private func setupAddSchedule() {
        self.view.backgroundColor = .systemBackground
        let backgroundImage = UIImageView(image: UIImage(named: "User"))
             backgroundImage.contentMode = .scaleAspectFill
             backgroundImage.frame = view.bounds
             view.addSubview(backgroundImage)
             view.sendSubviewToBack(backgroundImage)
     
        self.view.addSubview(headerView)
        self.view.addSubview(addButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
         
        NSLayoutConstraint.activate([

            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
               headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            
                // userButton constraints
                addButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
                addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                addButton.heightAnchor.constraint(equalToConstant: 50),

            ])
        
        
    }
            
            func loadDataFromFirebase() {
                databaseRef.child("schedule").observe(.childAdded, with: { (snapshot) in
                    if let dataDict = snapshot.value as? [String: Any] {
                        // Convert the snapshot data to Exercise model
                        let data = Schedule(
                            //id:dataDict["id"] as? String ?? "",
                            //image_url:dataDict["image_url"] as? String ?? "",
                                                id: dataDict["id"] as? String ?? "",
                                                name: dataDict["name"] as? String ?? "",
                                                date: dataDict["date"] as? String ?? "",
                                                time: dataDict["time"] as? String ?? "")
                        print(data)
                        self.dataSource.append(data)
                        self.tableView.reloadData()
                    }
                })
            }
       
            
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! ScheduleTableViewCell
                
                let data = dataSource[indexPath.row]
                cell.configure(withData: data)
             //   cell.actionButton.tag = indexPath.row // Set the row index as the button tag
             //   cell.actionButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                
                return cell
            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}
