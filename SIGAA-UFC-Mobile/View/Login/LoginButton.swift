//
//  LoadingButton.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTaps()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showLoading() {
        originalButtonText = self.titleLabel?.text
        self.setTitle("", for: .normal)
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        
        showSpinning()
    }
    
    func hideLoading() {
        self.setTitle(originalButtonText, for: .normal)
        activityIndicator.stopAnimating()
    }
    
    func loginSuccesful() {
        activityIndicator.stopAnimating()
        self.setImage(UIImage(systemName: "checkmark"), for: .normal)
        self.imageView?.tintColor = .white
    }
    
    private func setupTaps() {
        addTarget(self, action: #selector(holdRelease), for: .touchUpInside)
        addTarget(self, action: #selector(heldDown), for: .touchDown)
        addTarget(self, action: #selector(buttonHeldAndReleased), for: .touchDragExit)

    }
    
    //target functions
    @objc private func heldDown() {
        backgroundColor = .titlesBlue
    }

    @objc private func holdRelease() {
        backgroundColor = .primaryBlue
    }

    @objc private func buttonHeldAndReleased() {
        backgroundColor = .primaryBlue
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .lightGray
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
