//  
//  UIColor.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/5/16.
//  Copyright © 2020 debugeek. All rights reserved.
//

import UIKit

public extension UIColor {
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        if #available(iOS 10.0, *) {
            return UIGraphicsImageRenderer(size: size).image { rendererContext in
                self.setFill()
                rendererContext.fill(CGRect(origin: .zero, size: size))
            }
        } else {
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            setFill()
            UIRectFill(rect)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return image
        }
    }
    
}
