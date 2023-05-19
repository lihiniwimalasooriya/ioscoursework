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

    override func viewDidLoad() {
        super.viewDidLoad()

        //view.addSubview(timelineTableView)
        //timelineTableView.delegate = self
        //timelineTableView.dataSource = self
        
        // Configure Firebase
            FirebaseApp.configure()

            view.addSubview(timelineTableView)
            timelineTableView.delegate = self
            timelineTableView.dataSource = self

            // Set up Firebase database reference and observe for real-time updates
            let databaseRef = Database.database().reference()
            databaseRef.child("user_details").observe(.value) { [weak self] (snapshot) in
                // Handle the received data here
                // You can parse the data from the snapshot and update your table view
                self?.timelineTableView.reloadData()
            }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }
}
