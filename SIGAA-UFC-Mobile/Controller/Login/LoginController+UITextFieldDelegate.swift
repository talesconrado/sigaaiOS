//
//  LoginController+UITextFieldDelegate.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let textFieldText = textField.text else {
            return true
        }
        
        if textFieldText.isEmpty {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1
        } else {
            textField.layer.borderColor = UIColor.darkGray.cgColor
            textField.layer.borderWidth = 0.5
        }
        
        return true
    }
}
