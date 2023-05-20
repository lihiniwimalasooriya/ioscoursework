//
//  ExerciseListViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-19.
//

import UIKit
import Firebase

class ExerciseListViewController: UIViewController,UITableViewDataSource {
    
    var tableView: UITableView!
        var databaseRef: DatabaseReference!
        var dataSource: [ExerciseList] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize Firebase Database reference
            databaseRef = Database.database().reference()
            
            // Load data from Firebase
            loadDataFromFirebase()
            
            // Register custom cell
            tableView = UITableView(frame: view.bounds, style: .plain)
            tableView.dataSource = self
          
            tableView.register(ExerciseListTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
            view.addSubview(tableView)
        }
        
        func loadDataFromFirebase() {
            databaseRef.child("exercises").observe(.childAdded, with: { (snapshot) in
                if let dataDict = snapshot.value as? [String: Any] {
                    // Convert the snapshot data to Exercise model
                    let data = ExerciseList(image_url:dataDict["image_url"] as? String ?? "",
                                            name: dataDict["name"] as? String ?? "",
                                            count: dataDict["count"] as? Int ?? 0,
                                            time:dataDict["time"] as? String ?? "")
                    print(data)
                    self.dataSource.append(data)
                    self.tableView.reloadData()
                }
            })
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataSource.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! ExerciseListTableViewCell
            
            let data = dataSource[indexPath.row]
            cell.configure(withData: data)
            
            return cell
        }
    }
