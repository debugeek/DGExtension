//  
//  UIView.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/5/16.
//  Copyright © 2020 debugeek. All rights reserved.
//

import UIKit

public let pixelLength = 1.0/UIScreen.main.scale

extension UIView {
    
    var width: CGFloat {
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        } get {
            return bounds.size.width
        }
    }
    
    var height: CGFloat {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        } get {
            return bounds.size.height
        }
    }
    
}

extension UIView {
    
    public func foreachSubview(recursively: Bool, handler:((UIView) -> (Bool))) {
        for subview in subviews {
            if !handler(subview) {
                break
            }
            
            if recursively {
                subview.foreachSubview(recursively: recursively, handler: handler)
            }
        }
    }
    
}

