//
//  SceneDelegate.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 11/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if isUserLoggedIn {
            print("Usuário logado.")
        } else {
            let mainViewController = UINavigationController(rootViewController: LoginController())
            window?.rootViewController = mainViewController
        }
  
//        let mainViewController = UINavigationController(rootViewController: CoursesController())
//        window?.rootViewController = mainViewController
        
        window?.makeKeyAndVisible()

    }

}
