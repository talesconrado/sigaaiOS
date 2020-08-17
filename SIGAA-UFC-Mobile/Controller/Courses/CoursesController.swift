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
    
    lazy var userCard: UserCard = {
        let user = UserCard(user: self.user!)
        user.translatesAutoresizingMaskIntoConstraints = false
        
        return user
    }()
    
    let coursesTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.separatorStyle = .none
        tbv.refreshControl = nil
    
        return tbv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        //mockUser()
        setupUserCard()
        setupNavigationBar()
        setupTableView()
        setupConstraints()
    }
    
    func setupUserCard() {
        view.addSubview(userCard)
        let imageLoader = ImageLoader()
        
        if let strUrl = user?.foto.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let imgUrl = URL(string: strUrl) {
            imageLoader.loadImageWithUrl(imgUrl) { (foto) in
                self.userCard.userPicture.loaded()
                self.userCard.userPicture.image = foto
            }
        }
    }
    
    func setupTableView() {
        view.insertSubview(coursesTableView, belowSubview: userCard)
        coursesTableView.register(CourseCard.self, forCellReuseIdentifier: cellId)
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
    }
    
    func setupNavigationBar() {
        let largeTitleAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.titlesBlue,
            NSAttributedString.Key.font: UIFont.rounded(ofSize: 34, weight: .bold)
        ]
        
        let smallTitleAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.titlesBlue ]
        
        navigationController?.isNavigationBarHidden = false
        let navbar = navigationController?.navigationBar
        navbar?.prefersLargeTitles = true
        navbar?.largeTitleTextAttributes = largeTitleAttributes
        navbar?.titleTextAttributes = smallTitleAttributes
        navbar?.compactAppearance?.backgroundEffect = .none
        navbar?.backgroundColor = .backgroundBlue
        
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
            
            userCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            userCard.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            userCard.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            userCard.heightAnchor.constraint(equalToConstant: 100),
            
            coursesTableView.topAnchor.constraint(equalTo: userCard.bottomAnchor, constant: 5),
            coursesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            coursesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            coursesTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
