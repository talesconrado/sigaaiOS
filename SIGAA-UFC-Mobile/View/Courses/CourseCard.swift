//
//  CourseCard.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class CourseCard: UITableViewCell {
    
    let cardView: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        
        return card
    }()
            
    let title: UILabel = {
        let course = UILabel()
        course.translatesAutoresizingMaskIntoConstraints = false
        course.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        course.textColor = .black
        course.textAlignment = .left
        course.numberOfLines = 2
        
        return course
    }()
    
    let code: UILabel = {
        let code = UILabel()
        code.translatesAutoresizingMaskIntoConstraints = false
        code.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        code.textColor = .primaryBlue
        code.textAlignment = .left
        
        return code
    }()
    
    let calendarIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "calendar")
        icon.tintColor = .primaryBlue
        icon.contentMode = .scaleAspectFill
        
        return icon
    }()
    
    let days: UILabel = {
        let days = UILabel()
        days.translatesAutoresizingMaskIntoConstraints = false
        days.textColor = .black
        days.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        return days
    }()
        
    let time: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.textColor = .black
        time.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        return time
    }()
    
    let dateAndTimeStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        return stack
    }()
    
    let pinIcon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "mappin")
        icon.tintColor = .primaryBlue
        icon.contentMode = .scaleAspectFill
        
        return icon
    }()
    
    let location: UILabel = {
        let local = UILabel()
        local.translatesAutoresizingMaskIntoConstraints = false
        local.textColor = .black
        local.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        return local
    }()
    
    convenience init(course: Course) {
        self.init()
        self.title.text = course.componente
        self.code.text = course.codigo
        self.days.text = course.dias
        self.time.text = course.horario
        self.location.text = course.local
        backgroundColor = .white
        setupBorder()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        let subviewsList = [title, code, calendarIcon, dateAndTimeStack, pinIcon, location]
        for subview in subviewsList {
            cardView.addSubview(subview)
        }
        addSubview(cardView)
        setupStack()
    }
    
    func setupBorder() {
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 15
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
        cardView.layer.shadowRadius = 6
        cardView.layer.shadowOpacity = 0.9
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    }
    
    func setupStack() {
        dateAndTimeStack.addArrangedSubview(days)
        days.text = days.text?.capitalized
        dateAndTimeStack.addArrangedSubview(time)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 23),
            title.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 22),
            title.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -48),
            
            code.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            code.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 22),
            code.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -48),
            
            calendarIcon.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 22),
            calendarIcon.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -40),
            calendarIcon.widthAnchor.constraint(equalToConstant: 25),
            
            dateAndTimeStack.leftAnchor.constraint(equalTo: calendarIcon.rightAnchor, constant: 10),
            dateAndTimeStack.centerYAnchor.constraint(equalTo: calendarIcon.centerYAnchor),
            
            pinIcon.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -40),
            pinIcon.leftAnchor.constraint(equalTo: calendarIcon.rightAnchor, constant: 140),
            pinIcon.widthAnchor.constraint(equalToConstant: 20),
            
            location.centerYAnchor.constraint(equalTo: pinIcon.centerYAnchor),
            location.leftAnchor.constraint(equalTo: pinIcon.rightAnchor, constant: 10),
            
            cardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 27),
            cardView.rightAnchor.constraint(equalTo: rightAnchor, constant: -27),
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }

}
