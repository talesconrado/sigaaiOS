//
//  SigaaAPI.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

enum SigaaAPI: Router {
    
    case login
    
    var hostname: String {
        return "127.0.0.1"
    }
    
    var url: URL? {
        var sigaaLogin = URLComponents()
        sigaaLogin.scheme = "http"
        sigaaLogin.host = hostname
        sigaaLogin.port = 8081
        sigaaLogin.path = "/sigaa"
        
        //Construindo a URL toda como um Optional
        guard let sigaaURL = sigaaLogin.url else {
            preconditionFailure("Failed to construct the URL")
        }
        return sigaaURL
    }
    
}
