//
//  AuthViewController.swift
//  ioscoursework
//
//  Created by Lihini Wimalasooriya on 2023-05-07.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {
    
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
    }()
    
    public var compeletionHandler: ((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        view.addSubview(welcomeButton)
        welcomeButton.addTarget(self, action: #selector(didTapWelcome), for: .touchUpInside)    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    private let welcomeButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    @objc func didTapWelcome(){
        let vc = HomeViewController()
        
        vc.compeletionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleWelcome(sccess: success)
            }
        }
        
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleWelcome (sccess: Bool){
        //login user
    }   
}
