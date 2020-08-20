//
//  ClassNotesController+UITableView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 19/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

//swiftlint:disable force_cast
extension ClassNotesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return userNotes?.notes.count ?? 0
        } else {
            switch section {
            case 0:
                return tasksArray[0].count
            default:
                return tasksArray[1].count
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titles = ["Pendentes", "Feitas"]
        if segmentedControl.selectedSegmentIndex == 1 {
            return titles[section]
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentedControl.selectedSegmentIndex == 0 {
            return setupNoteCell(tableView, cellForRowAt: indexPath)
        } else {
            tableView.separatorStyle = .singleLine
            return setupTaskCell(tableView, cellForRowAt: indexPath)
        }
    }
    
    func setupNoteCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: noteCellId, for: indexPath) as! NoteCell
        cell.note = userNotes?.notes[indexPath.row]
        cell.selectionStyle = .none
        cell.update()
        return cell
    }
    
    func setupTaskCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId) ?? UITableViewCell(style: .value1, reuseIdentifier: taskCellId)
        cell.textLabel?.text = tasksArray[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = tasksArray[indexPath.section][indexPath.row].deadline.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if segmentedControl.selectedSegmentIndex == 0 {
            return 80
        } else {
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segmentedControl.selectedSegmentIndex == 0 {
            let note = userNotes?.notes[indexPath.row]
            let title = note?.title ?? ""
            let text = note?.text ?? ""
            showNoteModal(title: title, text: text, index: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if segmentedControl.selectedSegmentIndex == 0 {
                userNotes?.notes.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            delegate?.deleteNote(code: userNotes!.code, at: indexPath.row)
        }
    }
}
