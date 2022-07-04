//  
//  UIImage.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/5/16.
//  Copyright © 2020 debugeek. All rights reserved.
//

#if canImport(UIKit)

import UIKit

public extension UIImage {
    
    @objc class func image(withColor color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }

        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))

        return UIGraphicsGetImageFromCurrentImageContext() ?? .init()
    }
    
}

#endif
