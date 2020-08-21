//
//  ModalTaskController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 20/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ModalTaskController: UIViewController {
    
    var presenter: ClassNotesController?
    var delegate: ClassNotesDelegate?
    var code: String?

    lazy var contentView: ModalTask = {
        let view = ModalTask()
        view.taskTitle.delegate = self
        view.date.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    func setupNavBar() {
        let smallTitleAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.titlesBlue ]
        navigationController?.navigationBar.titleTextAttributes = smallTitleAttributes
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTask))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        navigationController?.navigationBar.tintColor = .primaryBlue
    }
    
    @objc func saveTask() {
        let title = contentView.taskTitle.text
        let date = contentView.date.text
        let status = contentView.taskStatusSwitch.isOn
        let task = Task(title: title!, deadline: date!, isTaskDone: status)
        delegate?.addTask(code: code!, task: task)
        presenter!.updateUserNotes()
        presenter!.notesTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ModalTaskController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.inputView as? UIDatePicker) != nil {
            self.contentView.pickerDone()
        }
        return true
    }
}
