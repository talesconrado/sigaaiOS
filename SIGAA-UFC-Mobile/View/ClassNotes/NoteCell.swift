//
//  NoteCell.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 18/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    var note: Note?
    
    let noteTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .titlesBlue
        title.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        title.textAlignment = .left
        title.numberOfLines = 1
        
        return title
    }()
    
    let noteContent: UILabel = {
        let content = UILabel()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.textColor = .gray
        content.textAlignment = .left
        content.numberOfLines = 2
        content.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        return content
    }()
    
    func update() {
        noteTitle.text = note?.title
        noteContent.text = note?.text
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(noteTitle)
        addSubview(noteContent)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            noteTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            noteTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            noteTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            
            noteContent.topAnchor.constraint(equalTo: noteTitle.bottomAnchor, constant: 1),
            noteContent.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            noteContent.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            noteContent.rightAnchor.constraint(equalTo: rightAnchor, constant: -15)
        ])
    }
    
}
