//
//  CoursesController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class CoursesListController: UIViewController, ClassNotesDelegate {
    
    var userData: UserData?
    var sigaaUserInfo: SigaaUserInfo?
    var cellId = "cellId"
    
    lazy var contentView: CoursesView = {
        let content = CoursesView(sigaaUserInfo: self.sigaaUserInfo)
        
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loadData()
        setupUserCard()
        setupNavigationBar()
        setupBarButton()
        setupTableView()
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    func loadData() {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if isUserLoggedIn {
            userData = Database.shared.loadData()
        } else {
            if let sigaaInfo = sigaaUserInfo {
                userData = UserData(sigaaUserInfo: sigaaInfo, classNotes: [:])
                UserDefaults.standard.set(1, forKey: "isUserLoggedIn")
                Database.shared.saveData(from: userData!)
            }
        }
    }
    
    func setupUserCard() {
        let imageLoader = ImageLoader()
        
        if let strUrl = userData!.sigaaUserInfo.foto.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let imgUrl = URL(string: strUrl) {
            imageLoader.loadImageWithUrl(imgUrl) { (picture) in
                self.contentView.userCard.userPicture.loaded()
                self.contentView.userCard.userPicture.image = picture
            }
        }
    }
    
    func setupTableView() {
        contentView.coursesTableView.register(CourseCard.self, forCellReuseIdentifier: cellId)
        contentView.coursesTableView.delegate = self
        contentView.coursesTableView.dataSource = self
    }
    
    func setupNavigationBar() {
        let largeTitleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.titlesBlue,
            NSAttributedString.Key.font: UIFont.rounded(ofSize: 34, weight: .bold)
        ]
        let smallTitleAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.titlesBlue ]
        
        navigationController?.isNavigationBarHidden = false
        let navbar = navigationController?.navigationBar
        navbar?.largeTitleTextAttributes = largeTitleAttributes
        navbar?.titleTextAttributes = smallTitleAttributes
        navbar?.compactAppearance?.backgroundEffect = .none
        navbar?.backgroundColor = .backgroundBlue
        
        navigationItem.setHidesBackButton(true, animated: false)
        self.title = "Disciplinas"
    }
    
    func setupBarButton() {
        let logoff = UIBarButtonItem(title: "Sair", style: .plain, target: self, action: #selector(openLogoffSheet))
        logoff.tintColor = .primaryBlue
        navigationItem.leftBarButtonItem = logoff
    }
    
    @objc func openLogoffSheet() {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Fazer logoff", style: .destructive, handler: { (_) in
            self.navigationController?.popToRootViewController(animated: true)
            UserDefaults.standard.set(0, forKey: "isUserLoggedIn")
        }))
        sheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(sheet, animated: true, completion: nil)
    }
    
    func initializeClassNotes(course: Course) -> ClassNotes {
        if let classNotes = userData?.classNotes[course.codigo] {
            print("Entrou aqui, não criou classNote.")
            return classNotes
        } else {
            print("Entrou aqui, classNotes era NIL.")
            let newClassNote = ClassNotes(courseTitle: course.componente, code: course.codigo, tasks: [[],[]], notes: [])
            userData?.classNotes[course.codigo] = newClassNote
            return newClassNote
        }
    }
    
    func addNote(code: String, note: Note, at index: Int? = nil) {
        
        if let index = index {
            userData?.classNotes[code]?.notes[index] = note
        } else {
            userData?.classNotes[code]?.notes.append(note)
        }
        print("NOVA NOTA ADICIONADA \(note.title)")
        Database.shared.saveData(from: userData!)
    }
    
    func addTask(code: String, task: Task, at index: Int?, array: Int) {
        if let index = index {
            userData?.classNotes[code]?.tasks[array][index] = task
        } else {
            userData?.classNotes[code]?.tasks[array].append(task)
        }
        Database.shared.saveData(from: userData!)
    }
    
    func deleteNote(code: String, at index: Int) {
        userData?.classNotes[code]?.notes.remove(at: index)
        Database.shared.saveData(from: userData!)
    }
    
    func deleteTask(code: String, at index: Int, array: Int) {
        userData?.classNotes[code]?.tasks[array].remove(at: index)
        Database.shared.saveData(from: userData!)
    }

}

protocol ClassNotesDelegate: class {
    func addNote(code: String, note: Note, at index: Int?)
    func addTask(code: String, task: Task, at index: Int?, array: Int)
    func deleteNote(code: String, at index: Int)
    func deleteTask(code: String, at index: Int, array: Int)
}
