//
//  LoginView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginTitleView: UIView {
    
    lazy var sigaaTitle: UILabel = {
        let stl = UILabel()
        stl.translatesAutoresizingMaskIntoConstraints = false
        stl.text = "SIGAA"
        stl.textColor = .titlesGray
        stl.font = UIFont.rounded(ofSize: 50, weight: .bold)
        
        return stl
    }()
    
    lazy var ufcTitle: UILabel = {
        let ufc = UILabel()
        ufc.translatesAutoresizingMaskIntoConstraints = false
        ufc.text = "UFC"
        ufc.textColor = .titlesBlue
        ufc.font = UIFont.rounded(ofSize: 50, weight: .bold)
        
        return ufc
    }()
    
    lazy var titleStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.addArrangedSubview(self.sigaaTitle)
        stack.addArrangedSubview(self.ufcTitle)
        
        return stack
    }()
    
    lazy var mobileLabel: UILabel = {
        let mbl = UILabel()
        mbl.translatesAutoresizingMaskIntoConstraints = false
        mbl.text = "Mobile"
        mbl.textColor = .titlesBlue
        mbl.font = .rounded(ofSize: 30, weight: .light)
        
        return mbl
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
        addSubview(titleStack)
        addSubview(mobileLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            titleStack.topAnchor.constraint(equalTo: topAnchor),
            
            mobileLabel.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 5),
            mobileLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
}
