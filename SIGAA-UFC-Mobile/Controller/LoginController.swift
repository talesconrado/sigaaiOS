//
//  LoginController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let loginCard: LoginCardView = {
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
        setupViews()
        setupConstraints()
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
