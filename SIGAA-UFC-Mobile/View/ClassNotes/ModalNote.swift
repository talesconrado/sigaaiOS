//
//  ModalNote.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 19/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ModalNote: UIView {
    
    let title: UITextField = {
        let title = UITextField()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.placeholder = "Título"
        title.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        title.textColor = .titlesBlue
        
        return title
    }()
    
    let text: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.allowsEditingTextAttributes = true
        text.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        text.layer.borderWidth = 0.2
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 12
        
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(title)
        addSubview(text)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            title.topAnchor.constraint(equalTo: topAnchor, constant: 44),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            
            text.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            text.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            text.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            text.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
        
        ])
    }
    
}
