//
//  CoursesController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class CoursesListController: UIViewController {
    
    var userData: UserData?
    var sigaaUserInfo: SigaaUserInfo?
    var cellId = "cellId"
    
    lazy var userCard: UserCard = {
        let user = UserCard(user: self.userData!.sigaaUserInfo)
        user.translatesAutoresizingMaskIntoConstraints = false
        
        return user
    }()
    
    let coursesTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.backgroundColor = .backgroundBlue
        tbv.separatorStyle = .none
        tbv.refreshControl = nil
    
        return tbv
    }()
    
    lazy var bottomLineView: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .backgroundBlue
        line.layer.shadowColor = UIColor.darkGray.cgColor
        line.layer.shadowRadius = 3
        line.layer.shadowOpacity = 0.9
        line.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        
        return line
    }()
    
    lazy var semesterLabel: UILabel = {
        let semester = UILabel()
        semester.translatesAutoresizingMaskIntoConstraints = false
        semester.text = self.userData?.sigaaUserInfo.semestre
        semester.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return semester
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if isUserLoggedIn {
            userData = Database.shared.loadData()
        } else {
            if let sigaaInfo = sigaaUserInfo {
                userData = UserData(sigaaUserInfo: sigaaInfo, classNotes: [])
                UserDefaults.standard.set(1, forKey: "isUserLoggedIn")
                Database.shared.saveData(from: userData!)
            }
        }
        
        setupUserCard()
        setupNavigationBar()
        setupBarButton()
        setupTableView()
        setupConstraints()
    }
    
    func setupUserCard() {
        view.addSubview(userCard)
        view.addSubview(semesterLabel)
        view.addSubview(bottomLineView)
        let imageLoader = ImageLoader()
        
        if let strUrl = userData!.sigaaUserInfo.foto.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
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
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            userCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            userCard.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            userCard.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            userCard.heightAnchor.constraint(equalToConstant: 100),
            
            semesterLabel.topAnchor.constraint(equalTo: userCard.bottomAnchor),
            semesterLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            bottomLineView.heightAnchor.constraint(equalToConstant: 2),
            bottomLineView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            bottomLineView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            bottomLineView.topAnchor.constraint(equalTo: semesterLabel.bottomAnchor, constant: 12),
            
            coursesTableView.topAnchor.constraint(equalTo: bottomLineView.bottomAnchor),
            coursesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            coursesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            coursesTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
