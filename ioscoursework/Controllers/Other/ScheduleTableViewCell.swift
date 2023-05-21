//
//  ScheduleTableViewCell.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-20.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
       var dateLabel: UILabel!
       var timeLabel: UILabel!
       var actionButton: UIButton!
           override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
               super.init(style: style, reuseIdentifier: reuseIdentifier)
               
               // Create and configure the UI elements
               nameLabel = UILabel()
               dateLabel = UILabel()
               timeLabel = UILabel()
               //listImageView = UIImageView()
               
               
               // Add UI elements to the cell's contentView
               contentView.addSubview(nameLabel)
              contentView.addSubview(dateLabel)
               contentView.addSubview(timeLabel)
               
               //contentView.addSubview(listImageView)
              // actionButton = UIButton(type: .system)
              // actionButton.setTitle("VIEW", for: .normal)
              // actionButton.translatesAutoresizingMaskIntoConstraints = false
              // contentView.addSubview(actionButton)
               
               // Configure UI element properties and layout constraints
               configureConstraints()
           }
           
           required init?(coder aDecoder: NSCoder) {
               fatalError("init(coder:) has not been implemented.")
           }
           
       func configure(withData data: Schedule) {
           nameLabel.text = data.name
           dateLabel.text = String(data.date)
           timeLabel.text = data.time
          // if let imageUrl = URL(string: data.image_url) {
            //     DispatchQueue.global().async {
              //       if let imageData = try? Data(contentsOf: imageUrl) {
              //           DispatchQueue.main.async {
              //               self.listImageView.image = UIImage(data: imageData)
               //          }
            //         }
          //       }
          //   } else {
                 // Set a default image if the URL is invalid or nil
           //      self.listImageView.image = UIImage(named: "BMI")
         //    }
       
               // Load image using Kingfisher
   //
           }
           
           func configureConstraints() {
               // Set up constraints for titleLabel, subtitleLabel, and customImageView
               // Adjust the constraints based on your desired layout
                   nameLabel.translatesAutoresizingMaskIntoConstraints = false
                   dateLabel.translatesAutoresizingMaskIntoConstraints = false
                   timeLabel.translatesAutoresizingMaskIntoConstraints = false
                 //  listImageView.translatesAutoresizingMaskIntoConstraints = false
                   
                   let constraints = [
                       // nameLabel constraints
                       nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                               nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                               nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

                               // dateLabel constraints
                               dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                               dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                               dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

                               // timeLabel constraints
                               timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
                               timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                               timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                               timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8) // Add bottom constraint to determine the height

                       
                       // listImageView constraints
                      // listImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                      // listImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                      // listImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                      // listImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                     //  listImageView.heightAnchor.constraint(equalToConstant: 200),
                      // actionButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
                     //  actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
    
                   ]
                   
                   NSLayoutConstraint.activate(constraints)
           }
   }
