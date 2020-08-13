//
//  ViewController.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 11/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let test :String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = ProcessInfo.processInfo.environment["user"] else {
            print("User not set.")
            return
        }
        guard let pwd = ProcessInfo.processInfo.environment["sigaa"] else {
            print("Password not set.")
            return
        }
        
        SigaaRepository().loginUser(login: user, senha: pwd) { user  in
            DispatchQueue.main.async {
                print(user)
            }
        }
    }

}
