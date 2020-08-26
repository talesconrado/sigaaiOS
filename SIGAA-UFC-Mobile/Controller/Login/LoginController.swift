//
//  LoginController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let coursesController = CoursesListController()
    
    let contentView: LoginView = {
        let content = LoginView()
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contentView.clearFields()
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    @objc func loginUser() {
        view.endEditing(true)
        contentView.loginCard.loginButton.showLoading()
        
        //checks textfields
        guard let login = contentView.loginCard.userTextField.text, let password = contentView.loginCard.passwordTextField.text else {
            print("Error: nil text fields.")
            return
        }
        
        //send user input to api
        SigaaService().loginUser(login: login,
                                 password: password) { sigaaUserInfo, statusCode  in
            DispatchQueue.main.async {
                //if it returns the data expected, show next screen
                if let sigaaUserInfo = sigaaUserInfo {
                    self.showCoursesScreen(from: sigaaUserInfo)
                } else {
                    //switches on HTTP status code to check if it was a network error
                    switch statusCode {
                    case 200:
                        self.alertUserError()
                    default:
                        self.alertConnectionError()
                    }
                }
            }
        }
    }
    
    func showCoursesScreen(from sigaaUserInfo: SigaaUserInfo? = nil) {
        contentView.loginCard.loginButton.loginSuccesful()
        coursesController.sigaaUserInfo = sigaaUserInfo
        self.navigationController?.pushViewController(self.coursesController, animated: true)
    }
    
    func alertUserError() {
        contentView.loginCard.loginButton.hideLoading()
        present(AlertsView.userError.alert(), animated: true, completion: nil)
    }
    
    func alertConnectionError() {
        contentView.loginCard.loginButton.hideLoading()
        present(AlertsView.networkError.alert(), animated: true, completion: nil)
    }
    
    func setupButton() {
        contentView.loginCard.loginButton.addTarget(self, action: #selector(self.loginUser), for: .touchUpInside)
    }
}
