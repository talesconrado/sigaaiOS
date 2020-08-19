//
//  NoteCell.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 18/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    let noteTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .titlesBlue
        title.textAlignment = .left
        title.numberOfLines = 1
        
        return title
    }()
    
    let noteContent: UILabel = {
        let content = UILabel()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.textColor = .lightGray
        content.textAlignment = .left
        content.numberOfLines = 2
        
        return content
    }()
    
    let noteStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        return stack
    }()
    
    convenience override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupConstraints()
    }
    
    
    func setupStackView() {
        addSubview(noteStack)
        noteStack.addArrangedSubview(noteTitle)
        noteStack.addArrangedSubview(noteContent)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            noteStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            noteStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            noteStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
        ])
    }
    
}
