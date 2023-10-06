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
    
    @objc convenience init?(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContext(size)
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: .zero, size: size))

        guard let cgImage = context.makeImage() else { return nil }

        self.init(cgImage: cgImage)
    }
    
}

#endif
