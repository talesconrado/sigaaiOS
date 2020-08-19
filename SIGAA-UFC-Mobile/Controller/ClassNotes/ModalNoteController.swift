//
//  ModalNoteController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 19/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ModalNoteController: UIViewController {
    
    let contentView: ModalNote = {
        let content = ModalNote()
        content.translatesAutoresizingMaskIntoConstraints = false
        
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        self.title = "Nova Anotação"
        setupView()
        setupNavBar()
        setupConstraints()
    }
    
    func setupNavBar() {
        let smallTitleAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.titlesBlue ]
        navigationController?.navigationBar.titleTextAttributes = smallTitleAttributes
    }
    
    func setupView() {
        view.addSubview(contentView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
        ])
    }
}
