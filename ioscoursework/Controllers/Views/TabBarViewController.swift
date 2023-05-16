//
//  TabBarViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-07.
//

import UIKit

class TabBarViewController: UITabBarController {
    
//    public var compeletionHandler2: ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeViewController()
        let vc2 = UserViewController()
        let vc3 = BMIViewController()
        let vc4 = HomePageViewController()
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "BMI"
        vc4.title = "test"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
       vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        vc4.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
       let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "BMI", image: UIImage(systemName: "gauge"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "test", image: UIImage(systemName: "house"), tag: 1)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3,nav4], animated: false)
    }}
