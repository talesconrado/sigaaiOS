//
//  UserPicture.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 17/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class UserPicture: UIImageView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView()
        act.translatesAutoresizingMaskIntoConstraints = false
        act.color = .gray
        
        return act
    }()
    
    override init(image: UIImage?) {
        super.init(image: nil)
        setupActivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupActivityIndicator() {
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }
    
    func isLoading() {
        activityIndicator.startAnimating()
    }
    
    func loaded() {
        activityIndicator.stopAnimating()
    }
    
}
