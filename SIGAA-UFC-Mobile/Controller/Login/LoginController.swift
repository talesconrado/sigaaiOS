//
//  LoginController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let coursesController = CoursesController()
    
    lazy var loginCard: LoginCardView = {
        let lcv = LoginCardView()
        lcv.translatesAutoresizingMaskIntoConstraints = false
        
        return lcv
    }()
    
    let loginTitle: LoginTitleView = {
        let title = LoginTitleView()
        title.translatesAutoresizingMaskIntoConstraints = false
       
        return title
    }()
    
    let backgroundIllustration: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "menina")
        background.image = image
    
        return background
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        navigationController?.isNavigationBarHidden = true
        
        setupDelegates()
        setupButton()
        setupKeyboardDismiss()
        setupViews()
        setupConstraints()
    }
    
    // MARK: DO NOT FORGET
    //FIX THIS MESSSS
    @objc func loginUser() {
        loginCard.loginButton.showLoading()
        guard let login = loginCard.userTextField.text, let password = loginCard.passwordTextField.text else {
            print("Error: nil text fields.")
            return
        }
        
        SigaaRepository().loginUser(login: login, password: password) { user  in
            DispatchQueue.main.async {
                sleep(1)
                if let user = user {
                    self.showCoursesScreen(from: user)
                } else {
                    sleep(1)
                    self.alertError()
                }
            }
        }
    }
    
    // MARK: Fix dis pls
    func showCoursesScreen(from user: User) {
        loginCard.loginButton.loginSuccesful()
        sleep(1)
        coursesController.user = user
        let navigationCourses = UINavigationController(rootViewController: coursesController)
        present(navigationCourses, animated: true, completion: nil)
    }
    
    func alertError() {
        loginCard.loginButton.hideLoading()
        print("Error.")
    }
    
    func setupButton() {
        loginCard.loginButton.addTarget(self, action: #selector(self.loginUser), for: .touchUpInside)
    }

    func setupDelegates() {
        loginCard.userTextField.delegate = self
        loginCard.passwordTextField.delegate = self
    }
    
    func setupKeyboardDismiss() {
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func didTapView() {
        view.endEditing(true)
    }
    
    func setupViews() {
        view.addSubview(loginCard)
        view.addSubview(loginTitle)
        view.insertSubview(backgroundIllustration, belowSubview: loginCard)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            loginCard.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            loginCard.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginCard.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            loginCard.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            
            loginTitle.bottomAnchor.constraint(equalTo: loginCard.topAnchor, constant: -30),
            loginTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65),
            
            backgroundIllustration.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundIllustration.topAnchor.constraint(equalTo: loginCard.bottomAnchor, constant: -50)
        
        ])
    }
}
