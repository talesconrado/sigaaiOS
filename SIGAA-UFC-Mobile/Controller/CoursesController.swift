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
    
    override func viewDidLoad() {
        view.backgroundColor = .backgroundBlue
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setHidesBackButton(true, animated: false)
        self.title = "Disciplinas"
    }
}
