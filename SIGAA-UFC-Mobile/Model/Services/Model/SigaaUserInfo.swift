//
//  User.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

struct SigaaUserInfo: Codable {
    var error: Bool
    var login: String
    var nome: String
    var foto: String
    var matricula: String
    var curso: String
    var nivel: String
    var status: String
    var entrada: String
    var semestre: String
    var cadeiras: [Course]
}
