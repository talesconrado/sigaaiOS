//
//  Database.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 17/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

class Database {
    
    //Singleton: Access by using Database.shared.<function-name>
    static let shared = Database()
    let documentsFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    var userDataURL: URL
    
    private init() {
        userDataURL = documentsFolder.appendingPathComponent("user.json")
    }

    func loadData() -> UserData? {
        
        var userData: UserData?

        do {
            let arquivoASerLido = try Data(contentsOf: userDataURL)
            userData = try JSONDecoder().decode(UserData.self, from: arquivoASerLido)
        } catch {
            print(error.localizedDescription)
        }
        
        return userData
    }

    func saveData(from userData: UserData) {
                
        do {
            let jsonData = try JSONEncoder().encode(userData)
            try jsonData.write(to: userDataURL)
        } catch {
            print("Impossível escrever no arquivo.")
        }
        
    }
}
