//
//  Font.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 14/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

import UIKit

extension UIFont {
    
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}
