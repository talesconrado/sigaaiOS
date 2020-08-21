//
//  ClassNotes.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 17/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

struct Task: Codable {
    var title: String
    var deadline: String
    var isTaskDone: Bool
}

struct Note: Codable {
    var title: String
    var text: String
}

struct ClassNotes: Codable {
    var courseTitle: String
    var code: String
    var tasks: [[Task]]
    var notes: [Note]
}
