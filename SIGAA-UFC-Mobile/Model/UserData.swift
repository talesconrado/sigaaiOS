//
//  UserData.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 17/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

struct UserData: Codable {
    var sigaaUserInfo: SigaaUserInfo
    var classNotes: [String: ClassNotes]
}
