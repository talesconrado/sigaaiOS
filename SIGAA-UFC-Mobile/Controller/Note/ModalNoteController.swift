//
//  ModalNoteController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 19/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ModalNoteController: UIViewController {
    
    var code: String?
    weak var delegate: ClassNotesDelegate?
    var presenter: ClassNotesController?
    var index: Int?
    
    lazy var contentView: ModalNote = {
        let content = ModalNote()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.text.delegate = self
        content.title.delegate = self
        content.text.becomeFirstResponder()
        
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        setupView()
        setupNavBar()
        setupConstraints()
    }
    
    func setupNavBar() {
        let smallTitleAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.titlesBlue ]
        navigationController?.navigationBar.titleTextAttributes = smallTitleAttributes
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        navigationController?.navigationBar.tintColor = .primaryBlue
    }
    
    @objc func saveNote() {
        let title = contentView.title.text ?? ""
        let text = contentView.text.text ?? ""
        let note = Note(title: title, text: text)
        delegate?.addNote(code: code!, note: note, at: index)
        presenter!.updateUserNotes()
        presenter!.notesTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
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
