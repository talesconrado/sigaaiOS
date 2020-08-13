//
//  Router.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 13/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

protocol Router {
    var hostname: String { get }
    var url: URL? { get }
}
