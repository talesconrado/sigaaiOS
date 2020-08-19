//
//  ClassNotesController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 18/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ClassNotesController: UIViewController {
    
    let taskCellId = "taskCellId"
    let noteCellId = "noteCellId"
    
    var userNotes: ClassNotes?
    
    lazy var courseTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.numberOfLines = 3
        title.textColor = .titlesBlue
        title.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        title.text = self.userNotes?.courseTitle.capitalized ?? ""
        
        return title
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segCtrl = UISegmentedControl()
        segCtrl.translatesAutoresizingMaskIntoConstraints = false
        segCtrl.insertSegment(withTitle: "Anotações", at: 0, animated: true)
        segCtrl.insertSegment(withTitle: "Tarefas", at: 1, animated: true)
        segCtrl.selectedSegmentIndex = 0
        
        return segCtrl
    }()
    
    let notesTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.backgroundColor = .backgroundBlue
        
        return tbv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        setupNavBar()
        setupTableView()
        setupViews()
        setupConstraints()
    }
    
    func setupTableView() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: taskCellId)
        notesTableView.register(NoteCell.self, forCellReuseIdentifier: noteCellId)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.tintColor = .primaryBlue
    }
    
    func setupViews() {
        let viewArray = [courseTitle, segmentedControl, notesTableView]
        for view in viewArray {
            self.view.addSubview(view)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            courseTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            courseTitle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40),
            courseTitle.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -70),
            
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            notesTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25),
            notesTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            notesTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            notesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
