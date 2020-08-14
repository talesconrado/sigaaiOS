//
//  LoginView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginTitleView: UIView {
    
    let sigaaTitle: UILabel = {
        let stl = UILabel()
        stl.translatesAutoresizingMaskIntoConstraints = false
        stl.text = "SIGAA"
        stl.textColor = .titlesGray
        stl.font = UIFont.rounded(ofSize: 34, weight: .bold)
        
        return stl
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
        addSubview(sigaaTitle)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            sigaaTitle.topAnchor.constraint(equalTo: topAnchor, constant: 50)
        
        ])
    }
}
