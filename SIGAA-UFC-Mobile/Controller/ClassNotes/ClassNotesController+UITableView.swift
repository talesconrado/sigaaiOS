//
//  ClassNotesController+UITableView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 19/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

extension ClassNotesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return userNotes?.tasks.count ?? 0
        } else {
            return userNotes?.notes.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentedControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: noteCellId, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: taskCellId, for: indexPath)
            return cell
        }
    }
    
}
