//
//  ScheduleViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-20.
//

import UIKit
import Firebase
import FirebaseDatabase

class ScheduleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private let headerView = AuthHeaderView(title: "My Schedule", subTitle: "***")
    var tableView: UITableView!
            var databaseRef: DatabaseReference!
            var dataSource: [Schedule] = []
            
            override func viewDidLoad() {
                super.viewDidLoad()
                let button = UIButton(type: .system)
                        button.setTitle("Your Button Title", for: .normal)
                button.backgroundColor = .black
                        button.translatesAutoresizingMaskIntoConstraints = false
                        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                        view.addSubview(button)
                
                // Initialize Firebase Database reference
                databaseRef = Database.database().reference()
                
                // Load data from Firebase
                loadDataFromFirebase()
                
                // Register custom cell
                tableView = UITableView(frame: view.bounds, style: .plain)
                tableView.dataSource = self
              
                tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
                
               
                view.addSubview(tableView)
                let buttonConstraints = [
                     button.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
                     button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                     // Add more constraints as needed
                 ]
                 NSLayoutConstraint.activate(buttonConstraints)
            }
            
            func loadDataFromFirebase() {
                self.view.addSubview(headerView)
                databaseRef.child("schedule").observe(.childAdded, with: { (snapshot) in
                    if let dataDict = snapshot.value as? [String: Any] {
                        let data = Schedule(
                            id: dataDict["id"] as? String ?? "",
                            name: dataDict["name"] as? String ?? "",
                            date: dataDict["date"] as? String ?? "",
                            time: dataDict["time"] as? String ?? ""
                        )
                        self.dataSource.append(data)
                        self.tableView.reloadData()
                    }
                })
                
                self.view.addSubview(headerView)
                
                headerView.translatesAutoresizingMaskIntoConstraints = false
                 
                NSLayoutConstraint.activate([

                    headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

                    ])
            }
    
        @objc func buttonTapped(_ sender: UIButton) {
              let selectedData = dataSource[sender.tag]
            let documentID = selectedData.id
              print("Selected document ID:", documentID)
              let detailViewController = DetailViewController()
                    
                    // Set the document ID property of the destination view controller
            detailViewController.documentId = documentID
                    
                    // Present the destination view controller
            self.navigationController?.pushViewController(detailViewController, animated: true)

              
              // Perform any operations based on the selected document ID
          }
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return dataSource.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! ScheduleTableViewCell
                
                let data = dataSource[indexPath.row]
                cell.configure(withData: data)
                
                return cell
            }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 120 // Set the desired height for the table view cell
     }
    
}
