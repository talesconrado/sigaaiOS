//
//  UserCard.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class UserCard: UIView {
    
    let userPicture: UserPicture = {
        let picture = UserPicture(image: nil)
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.isLoading()
        picture.contentMode = .scaleAspectFit
        
        return picture
    }()
    
    let userName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        name.textAlignment = .left
        
        return name
    }()
    
    let program: UILabel = {
        let program = UILabel()
        program.translatesAutoresizingMaskIntoConstraints = false
        program.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        program.textAlignment = .left
        
        return program
    }()
    
    let userId: UILabel = {
        let uid = UILabel()
        uid.translatesAutoresizingMaskIntoConstraints = false
        uid.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        uid.textAlignment = .left
        
        return uid
    }()
    
    let userInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        return stack
    }()
    
    convenience init(user: SigaaUserInfo) {
        self.init()
        userName.text = user.nome.capitalized
        userId.text = user.matricula
        program.text = user.curso.capitalized
        addSubview(userPicture)
        setupCard()
        setupStack()
        setupConstraints()
    }
    
    func setupCard() {
        layer.cornerRadius = 15
    }
    
    func setupStack() {
        userInfoStack.addArrangedSubview(userName)
        userInfoStack.addArrangedSubview(program)
        userInfoStack.addArrangedSubview(userId)
        addSubview(userInfoStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            userPicture.rightAnchor.constraint(equalTo: userInfoStack.leftAnchor, constant: -15),
            userPicture.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            userPicture.centerYAnchor.constraint(equalTo: centerYAnchor),
            userPicture.heightAnchor.constraint(equalToConstant: 70),
            
            userInfoStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            userInfoStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -26),
            userInfoStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 100),
            userInfoStack.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        
        ])
    }
}
