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

    @objc class func color(withHexString hexString: String) -> UIColor? {
        var hexString = hexString.lowercased()
        if hexString.hasPrefix("0x") {
            hexString = hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            hexString = hexString.replacingOccurrences(of: "#", with: "")
        }

        guard let hex = UInt32(hexString, radix: 16) else {
            return nil
        }
        
        switch hexString.count {
        case 6:
            return UIColor.color(withHex: hex, alpha: 1)
        case 8:
            return UIColor.color(withHex: (hex >> 8) & 0xffffff, alpha: CGFloat(hex & 0xff)/255)
        default:
            return nil
        }
    }

    @objc class func color(withHex hex: UInt32, alpha: CGFloat = 1) -> UIColor? {
        let red = (hex >> 16) & 0xff
        let green = (hex >> 8) & 0xff
        let blue = hex & 0xff
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: alpha)
    }
    
}

#endif
