//
//  Course.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

struct Course: Decodable {
    var codigo: String
    var componente: String
    var cargaHoraria: Int
    var local: String
    var dias: String
    var horario: String
}
