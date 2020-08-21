//
//  LoginCardView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginCardView: UIView {
            
    lazy var iconConfig: UIImage.SymbolConfiguration = {
        let config = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20, weight: .semibold))
        
        return config
    }()
    
    lazy var userTextField: LoginTextFields = {
        let txt = LoginTextFields()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = "Usuário"
        txt.layer.borderWidth = 0.5
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.cornerRadius = 13
        txt.returnKeyType = .done
        txt.autocapitalizationType = .none
        txt.clearButtonMode = .whileEditing
        txt.accessibilityIdentifier = "login"
        
        let icon = UIImageView(image: UIImage(systemName: "person", withConfiguration: self.iconConfig))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .primaryBlue
        
        txt.leftView = icon
        txt.leftViewMode = .always
        
        return txt
    }()
        
    lazy var passwordTextField: LoginTextFields = {
        let pwd = LoginTextFields()
        pwd.translatesAutoresizingMaskIntoConstraints = false
        pwd.placeholder = "Senha"
        pwd.layer.borderWidth = 0.5
        pwd.layer.borderColor = UIColor.darkGray.cgColor
        pwd.layer.cornerRadius = 13
        pwd.isSecureTextEntry = true
        pwd.returnKeyType = .done
        pwd.autocapitalizationType = .none
        pwd.clearButtonMode = .whileEditing
        pwd.accessibilityIdentifier = "password"
        
        let icon = UIImageView(image: UIImage(systemName: "lock", withConfiguration: self.iconConfig))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .primaryBlue
        
        pwd.leftView = icon
        pwd.leftViewMode = .always
        
        return pwd
    }()
    
    let loginButton: LoginButton = {
        let btn = LoginButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .primaryBlue
        btn.setTitle("Entrar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        btn.layer.cornerRadius = 8
        btn.contentEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCard() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.9
        layer.shadowOffset = CGSize(width: 0.0, height: 8)
    }
    
    func setupViews() {
        addSubview(userTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userTextField.topAnchor.constraint(equalTo: topAnchor, constant: 42),
            userTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            userTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            userTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10),
            
            passwordTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -84),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            
            loginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
