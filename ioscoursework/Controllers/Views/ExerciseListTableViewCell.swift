//
//  ExerciseListTableViewCell.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-19.
//

import UIKit
//import Kingfisher

class ExerciseListTableViewCell: UITableViewCell {
    //test
    var nameLabel: UILabel!
    var countLabel: UILabel!
    var timeLabel: UILabel!
    var listImageView: UIImageView!
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            // Create and configure the UI elements
            nameLabel = UILabel()
            countLabel = UILabel()
            timeLabel = UILabel()
            listImageView = UIImageView()
            
            // Add UI elements to the cell's contentView
            contentView.addSubview(nameLabel)
            contentView.addSubview(countLabel)
            contentView.addSubview(timeLabel)
            contentView.addSubview(listImageView)
            
            // Configure UI element properties and layout constraints
            configureConstraints()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented.")
        }
        
    func configure(withData data: ExerciseList) {
        nameLabel.text = data.name
        countLabel.text = String(data.count)
        timeLabel.text = data.time
       // if let imageUrl = URL(string: data.image_url) {
       //     listImageView.kf.setImage(with: imageUrl)
       // }
            
            // Load image using Kingfisher
//
        }
        
        func configureConstraints() {
            // Set up constraints for titleLabel, subtitleLabel, and customImageView
            // Adjust the constraints based on your desired layout
                nameLabel.translatesAutoresizingMaskIntoConstraints = false
                countLabel.translatesAutoresizingMaskIntoConstraints = false
                timeLabel.translatesAutoresizingMaskIntoConstraints = false
                listImageView.translatesAutoresizingMaskIntoConstraints = false
                
                let constraints = [
                    // nameLabel constraints
                    nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                    nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    
                    // countLabel constraints
                    countLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                    countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    countLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    
                    // timeLabel constraints
                    timeLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 8),
                    timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    
                    // listImageView constraints
                    listImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8),
                    listImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    listImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    listImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                    listImageView.heightAnchor.constraint(equalToConstant: 200)
                ]
                
                NSLayoutConstraint.activate(constraints)
        }
}
