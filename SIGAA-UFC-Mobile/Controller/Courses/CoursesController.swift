//
//  CoursesController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class CoursesController: UIViewController {
    
    var user: User?
    var cellId = "cellId"
    
    let coursesTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.separatorStyle = .none
    
        return tbv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        mockUser()
        setupNavigationBar()
        setupTableView()
        setupConstraints()
    }
    
    func setupTableView() {
        view.addSubview(coursesTableView)
        coursesTableView.register(CourseCard.self, forCellReuseIdentifier: cellId)
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
    }
    
    func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        
        let navbar = navigationController?.navigationBar
        
        navbar?.prefersLargeTitles = true
        let titleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.titlesBlue,
            NSAttributedString.Key.font: UIFont.rounded(ofSize: 34, weight: .bold)
        ]
        navbar?.largeTitleTextAttributes = titleAttributes
        
        navigationItem.setHidesBackButton(true, animated: false)
        self.title = "Disciplinas"
    }
    
    func mockUser() {
        let courseOne = Course(codigo: "CK0235",
                               componente: "TÉCNICAS DE PROGRAMAÇÃO 1",
                               cargaHoraria: 64,
                               local: "915/1054",
                               dias: "TER/QUI",
                               horario: "08:00-10:00")
        
        let courseTwo = Course(codigo: "CK0265",
                               componente: "SISTEMAS DE GERENCIAMENTO DE BANCOS DE DADOS",
                               cargaHoraria: 64,
                               local: "LEC 2 951",
                               dias: "SEG/QUA/SEX",
                               horario: "18:00-20:00")
        
        let mockUser = User(error: false,
                            login: "talesconrado",
                            nome: "TALES MATEUS CHAVES CONRADO",
                            foto: "https://si3.ufc.br/sigaa/img/no_picture.png",
                            matricula: "123894",
                            curso: "CIÊNCIA DA COMPUTAÇÃO - MT",
                            nivel: "GRADUAÇÃO",
                            status: "ATIVO",
                            entrada: "2019.1",
                            semestre: "2020.1",
                            cadeiras: [courseOne, courseTwo])
        self.user = mockUser
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coursesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coursesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            coursesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            coursesTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
