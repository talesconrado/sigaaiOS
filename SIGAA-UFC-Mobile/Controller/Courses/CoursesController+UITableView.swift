//
//  CoursesController+UITableView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 16/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

extension CoursesListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "2020.1"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userData = userData else {
            print("Found user nil in cell creation.")
            return UITableViewCell()
        }
        let course = userData.sigaaUserInfo.cadeiras[indexPath.section]
        let cell = CourseCard(course: course)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        if let userData = userData {
            return userData.sigaaUserInfo.cadeiras.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classNoteVC = ClassNotesController()
        classNoteVC.delegate = self
        if let course = userData?.sigaaUserInfo.cadeiras[indexPath.section] {
            classNoteVC.userNotes = initializeClassNotes(course: course)
        } else {
            print("Error while unwrapping course.")
        }
        navigationController?.pushViewController(classNoteVC, animated: true)
    }
}
