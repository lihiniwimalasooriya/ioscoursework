//
//  ListViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-17.
//

import UIKit
import Firebase

class ListViewController: UIViewController {
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // Define an array to hold your data
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure Firebase
        FirebaseApp.configure()

        view.addSubview(timelineTableView)
        timelineTableView.delegate = self
        timelineTableView.dataSource = self

        let databaseRef = Database.database().reference()
                databaseRef.child("user_details").observe(.value) { [weak self] (snapshot) in
                    // Handle the received data here
                    // Clear the existing data array
                    self?.items.removeAll()
                    
                    // Iterate through the snapshot's children
                    for case let childSnapshot as DataSnapshot in snapshot.children {
                        // Extract the value from the snapshot and add it to the data array
                        if let value = childSnapshot.value as? String {
                            self?.items.append(value)
                        }
                    }
                    
                    // Reload the table view to display the updated data
                    self?.timelineTableView.reloadData()
                }
            }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.bounds
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
