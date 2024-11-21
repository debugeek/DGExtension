//  
//  UIColor.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/5/16.
//  Copyright © 2020 debugeek. All rights reserved.
//

#if canImport(UIKit)

import UIKit

public extension UIColor {

    convenience init?(hex: String) {
        var hex = hex.lowercased()
        if hex.hasPrefix("0x") {
            hex = hex.replacingOccurrences(of: "0x", with: "")
        } else if hex.hasPrefix("#") {
            hex = hex.replacingOccurrences(of: "#", with: "")
        }
        let digits = hex.count

        guard let hex = UInt32(hex, radix: 16) else {
            return nil
        }
        
        switch digits {
        case 6:
            self.init(hex: hex, alpha: 1)
        case 8:
            self.init(hex: (hex >> 8) & 0xffffff, alpha: CGFloat(hex & 0xff)/255)
        default:
            return nil
        }
    }

    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: alpha)
    }
    
}

#endif
