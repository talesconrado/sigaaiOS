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
        
        let login = LoginController()
        let courses = CoursesController()
        
        let navigation = UINavigationController(rootViewController: login)
        
        if isUserLoggedIn {
            navigation.pushViewController(courses, animated: false)
        }
        
        window?.rootViewController = navigation
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()

    }

}
