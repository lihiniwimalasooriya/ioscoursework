//
//  AuthHeaderView.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-12.
//

import UIKit

class AuthHeaderView: UIView {

    private let profileImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Images" )
        iv.tintColor = .white
        return iv
    } ()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        return label
    } ()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    } ()
    
    init(title: String, subTitle: String){
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(profileImg)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)

        profileImg.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
                self.profileImg.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
                self.profileImg.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.profileImg.widthAnchor.constraint(equalToConstant: 90),
                self.profileImg.heightAnchor.constraint(equalTo: profileImg.widthAnchor),
                
                self.titleLabel.topAnchor.constraint(equalTo: profileImg.bottomAnchor, constant: 19),
                self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
                self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
}
