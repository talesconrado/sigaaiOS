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
    var tasksArray: [[Task]] = [[],[]]
    weak var delegate: ClassNotesDelegate?
    
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
    
    lazy var segmentedControl: UISegmentedControl = {
        let segCtrl = UISegmentedControl()
        segCtrl.translatesAutoresizingMaskIntoConstraints = false
        segCtrl.insertSegment(withTitle: "Anotações", at: 0, animated: true)
        segCtrl.insertSegment(withTitle: "Tarefas", at: 1, animated: true)
        segCtrl.selectedSegmentIndex = 0
        segCtrl.addTarget(self, action: #selector(didSegmentChange), for: .valueChanged)

        return segCtrl
    }()
    
    let notesTableView: UITableView = {
        let tbv = UITableView()
        tbv.contentInsetAdjustmentBehavior = .never
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.backgroundColor = .white
        tbv.tableFooterView = UIView()
        
        return tbv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        setupNavBar()
        setupTableView()
        setupViews()
        setupConstraints()
        updateTasksArray()
    }
    
    @objc func didSegmentChange() {
        notesTableView.reloadData()
    }
    
    func updateUserNotes() {
        let data = Database.shared.loadData()
        userNotes = data?.classNotes[userNotes!.code]
    }
    
    func updateTasksArray() {
        guard let tasks = userNotes?.tasks else {
            return
        }
        
        for task in tasks {
            if task.isTaskDone {
                tasksArray[1].append(task)
            } else {
                tasksArray[0].append(task)
            }
        }
        
    }
    
    func setupTableView() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(NoteCell.self, forCellReuseIdentifier: noteCellId)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.tintColor = .primaryBlue
        let addTaskButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddOptions))
        navigationItem.setRightBarButton(addTaskButton, animated: true)
    }
    
    @objc func showAddOptions() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let newNote = UIAlertAction(title: "Nova Anotação", style: .default) { (_) in
            self.showNoteModal()
        }
        let newTask = UIAlertAction(title: "Nova Tarefa", style: .default) { (_) in
            print("nova tarefa")
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        actionSheet.addAction(newNote)
        actionSheet.addAction(newTask)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    func showNoteModal(title: String = "", text: String = "", index: Int? = nil) {
        let modalNoteVC = ModalNoteController()
        modalNoteVC.delegate = delegate
        modalNoteVC.code = userNotes?.code
        modalNoteVC.presenter = self
        modalNoteVC.contentView.title.text = title
        modalNoteVC.contentView.text.text = text
        modalNoteVC.index = index
        let navigation = UINavigationController(rootViewController: modalNoteVC)
        navigation.modalPresentationStyle = .formSheet
        present(navigation, animated: true, completion: nil)
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
            courseTitle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            courseTitle.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -70),
            
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            notesTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            notesTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            notesTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            notesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
