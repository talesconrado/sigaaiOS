//
//  ModalNoteController+TextDelegate.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 20/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

extension ModalNoteController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .black
        if textView.text == "Escreva aqui sua anotação..." {
            textView.text.removeAll()
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = .lightGray
            textView.text = "Escreva aqui sua anotação..."
        }
    }
    
}

extension ModalNoteController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
