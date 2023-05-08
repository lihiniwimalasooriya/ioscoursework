//
//  WelcomeViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-07.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fitness"
        view.backgroundColor = .systemBlue
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50)
    }
    
    @objc func didTapSignIn(){
        let vc = AuthViewController()
        vc.compeletionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(sccess: success)
                
            }
            
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn (sccess: Bool){
        //login user
    }

}
