//
//  ListViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-14.
//

import UIKit

class ListViewController: UITableViewController {

    // MARK: - Properties
      
      let reuseIdentifier = "MovieCell"
      
      var myMovies: [Movies]? {
        didSet {
          DispatchQueue.main.async { [self] in
            tableView.reloadData()
          }
        }
      }
      
      // MARK: - Lifecycle
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        let movieManager = ListManager()
        
        movieManager.fetchMovies { (movies) in
          DispatchQueue.main.async { [self] in
            navigationItem.title = movies.title
          }
          
          self.myMovies = movies.movies
        }
      }

      // MARK: - Helpers
      
      func configureTableView() {
        tableView.backgroundColor = .lightGray
        tableView.tableFooterView = UIView()
      }

    }

    // MARK: - UITableViewDataSource & UITableViewDelegate Methods

    extension ListViewController {
      
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovies?.count ?? 0
      }
      
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        guard let movie = myMovies?[indexPath.row] else { return UITableViewCell() }
        
        cell.textLabel?.text = "\(movie.title) - \(movie.releaseYear)"
        
        return cell
      }
      
    }
