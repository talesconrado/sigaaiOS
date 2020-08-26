//
//  CoursesView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 26/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class CoursesView: UIView {
    
    var sigaaUserInfo: SigaaUserInfo?
    
    lazy var userCard: UserCard = {
        let user = UserCard(user: self.sigaaUserInfo!)
        user.translatesAutoresizingMaskIntoConstraints = false
        
        return user
    }()
    
    let coursesTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.backgroundColor = .backgroundBlue
        tbv.separatorStyle = .none
        tbv.refreshControl = nil
        tbv.accessibilityIdentifier = "coursesList"
    
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
        semester.text = self.sigaaUserInfo!.semestre
        semester.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return semester
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(sigaaUserInfo: SigaaUserInfo?) {
        self.init()
        self.sigaaUserInfo = sigaaUserInfo
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(userCard)
        addSubview(coursesTableView)
        addSubview(bottomLineView)
        addSubview(semesterLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            userCard.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            userCard.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30),
            userCard.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30),
            userCard.heightAnchor.constraint(equalToConstant: 100),
            
            semesterLabel.topAnchor.constraint(equalTo: userCard.bottomAnchor),
            semesterLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            bottomLineView.heightAnchor.constraint(equalToConstant: 2),
            bottomLineView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            bottomLineView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            bottomLineView.topAnchor.constraint(equalTo: semesterLabel.bottomAnchor, constant: 12),
            
            coursesTableView.topAnchor.constraint(equalTo: bottomLineView.bottomAnchor),
            coursesTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            coursesTableView.leftAnchor.constraint(equalTo: leftAnchor),
            coursesTableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
}
