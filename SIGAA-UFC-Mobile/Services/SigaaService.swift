//
//  SigaaRepository.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

class SigaaService {
    
    func loginUser(login: String, password: String, completion: @escaping (SigaaUserInfo?, Int?) -> Void = { sigaaUserInfo, statusCode in }) {
        
        HTTP.post.request(url: SigaaAPI.login.url, body: ["login":login, "senha": password]) { data, response, errorMessage in

            if let errorMessage = errorMessage {
                print(errorMessage)
                completion(nil, response?.statusCode)
                return
            }

            guard let data = data, let response = response else {
                print("No data or response.")
                completion(nil, nil)
                return
            }
            
            switch response.statusCode {
            case 200:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try? decoder.decode(SigaaUserInfo.self, from: data)
                completion(user, response.statusCode)
            default:
                print("Error in request.\nStatus code \(response.statusCode)")
                completion(nil, response.statusCode)
            }
            
        }

    }
    
}
