//
//  HTTP.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

enum HTTP {
    case get
    case post
    
    func request(url: URL?,
                 header: [String : String] = ["Content-Type":"application/json"],
                 body: [String : String] = [:],
                 completion: @escaping (Data?, HTTPURLResponse?, String?) -> Void = { data, response, error in }) {
    
        guard let url = url else {
            completion(nil, nil, "URL Inválida!")
            return
        }
        
        switch self {
        case .get:
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()

        case .post:

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = header
            
            guard let data = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) else {
                print("Could not decode data.")
                return
            }
            
            urlRequest.httpBody = data
        
            URLSession.shared.uploadTask(with: urlRequest, from: data) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()
        }
    }
}
