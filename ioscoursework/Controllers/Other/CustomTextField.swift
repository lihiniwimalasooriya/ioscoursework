//
//  CustomTextField.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-12.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case username
        case email
        case password
        case heightBMI
        case weightBMI
        case name
        case age
        case gender
        case height
        case weight
        case goal
        case planname
        case datePicker
        case timePicker
        }
        
    private let authFieldType: CustomTextFieldType
            
        init(fieldType: CustomTextFieldType) {
                   self.authFieldType = fieldType
                   super.init(frame: .zero)
                   
                   self.backgroundColor = .secondarySystemBackground
                   self.layer.cornerRadius = 10
                   
                   self.returnKeyType = .done
                   self.autocorrectionType = .no
                   self.autocapitalizationType = .none
                   
                   self.leftViewMode = .always
                   self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
                   
                   switch fieldType {
                   case .username:
                       self.placeholder = "Username"
                   case .email:
                       self.placeholder = "Username"
                       self.keyboardType = .emailAddress
                       self.textContentType = .emailAddress
                   case .password:
                       self.placeholder = "Password"
                       self.textContentType = .oneTimeCode
                       self.isSecureTextEntry = true
                   case .heightBMI:
                       self.placeholder = "Height(cm)"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .weightBMI:
                       self.placeholder = "Weight(kg)"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .name:
                       self.placeholder = "Full Name"
                       self.layer.borderWidth = 1.0
                      self.layer.borderColor = UIColor.lightGray.cgColor
                   case .age:
                       self.placeholder = "Age"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .height:
                       self.placeholder = "Height(cm)"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .weight:
                       self.placeholder = "Weight(kg)"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .goal:
                       self.placeholder = "Fitness Goal"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .planname:
                       self.placeholder = "Plan Description"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .datePicker:
                       self.placeholder = "Date"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   case .timePicker:
                       self.placeholder = "Time"
                       self.layer.borderWidth = 1.0
                       self.layer.borderColor = UIColor.lightGray.cgColor
                   default:
                    break
                   }
        }
                      
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
                      
   }
