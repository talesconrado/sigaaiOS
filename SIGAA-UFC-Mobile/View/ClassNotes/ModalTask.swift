//
//  ModalTask.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 19/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ModalTask: UIView {
    let taskTitle: UITextField = {
        let title = UITextField()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.placeholder = "Descrição da tarefa"
        title.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        title.textColor = .titlesBlue
        title.returnKeyType = .done
        title.becomeFirstResponder()
        
        return title
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data de Entrega"
        
        return label
    }()
    
    let date: UITextField = {
        let date = UITextField()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.tintColor = .clear
        
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        
        date.inputView = picker
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        date.text = dateFormatter.string(from: picker.date)
        
        return date
    }()
    
    let taskStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entregue"
        
        return label
    }()
    
    let taskStatusSwitch: UISwitch = {
        let done = UISwitch()
        done.translatesAutoresizingMaskIntoConstraints = false
        done.onTintColor = .primaryBlue
        
        return done
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundBlue
        setupViews()
        //setupToolBar()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pickerDone() {
        if let datePicker = self.date.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            self.date.text = dateformatter.string(from: datePicker.date)
        }
        self.date.resignFirstResponder()
    }
    
    func setupViews() {
        let views = [taskTitle, dateLabel, date, taskStatusLabel, taskStatusSwitch]
        for view in views {
            addSubview(view)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            taskTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            taskTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            taskTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -90),
            
            dateLabel.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 20),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            
            date.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            date.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            
            taskStatusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            taskStatusLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            
            taskStatusSwitch.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            taskStatusSwitch.centerYAnchor.constraint(equalTo: taskStatusLabel.centerYAnchor)
        
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}
