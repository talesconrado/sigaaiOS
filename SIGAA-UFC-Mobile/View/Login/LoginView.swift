//
//  LoginView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 26/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    lazy var loginCard: LoginCardView = {
        let lcv = LoginCardView()
        lcv.translatesAutoresizingMaskIntoConstraints = false
        lcv.userTextField.delegate = self
        lcv.passwordTextField.delegate = self
        
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundBlue
        setupKeyboardDismiss()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupKeyboardDismiss() {
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.didTapView))
        addGestureRecognizer(tapRecognizer)
    }
    
    @objc func didTapView() {
        endEditing(true)
    }
    
    func setupViews() {
        addSubview(loginCard)
        addSubview(loginTitle)
        insertSubview(backgroundIllustration, belowSubview: loginCard)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            loginCard.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            loginCard.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loginCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 60),
            loginCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -60),
            
            loginTitle.bottomAnchor.constraint(equalTo: loginCard.topAnchor, constant: -30),
            loginTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 65),
            
            backgroundIllustration.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundIllustration.topAnchor.constraint(equalTo: loginCard.bottomAnchor, constant: -50)
        
        ])
    }
    
    func clearFields() {
        loginCard.passwordTextField.text = ""
        loginCard.passwordTextField.resignFirstResponder()
        loginCard.userTextField.text = ""
        loginCard.userTextField.resignFirstResponder()
        loginCard.loginButton.setTitle("Entrar", for: .normal)
        loginCard.loginButton.setImage(nil, for: .normal)
    }
    
}
