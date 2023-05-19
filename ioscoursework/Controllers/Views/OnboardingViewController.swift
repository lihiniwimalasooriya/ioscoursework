//
//  OnboardingViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-18.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = OnboardingViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }

}
