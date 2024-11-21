//  
//  UIView.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/5/16.
//  Copyright © 2020 debugeek. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UIView {
    
    var top: CGFloat {
        set { frame.origin.y = newValue }
        get { frame.origin.y }
    }
    
    var left: CGFloat {
        set { frame.origin.x = newValue }
        get { frame.origin.x }
    }
    
    var bottom: CGFloat {
        set { frame.origin.y = newValue - frame.size.height }
        get { frame.origin.y + frame.size.height }
    }

    var right: CGFloat {
        set { frame.origin.x = newValue - frame.size.width }
        get { frame.origin.x + frame.size.width }
    }

    var centerX: CGFloat {
        set { center.x = newValue }
        get { center.x }
    }

    var centerY: CGFloat {
        set { center.y = newValue }
        get { center.y }
    }
    
    var width: CGFloat {
        set { frame.size.width = newValue }
        get { frame.size.width }
    }
    
    var height: CGFloat {
        set { frame.size.height = newValue }
        get { frame.size.height }
    }
    
}

public extension UIView {

    func enumerateSubviews(recursively: Bool, using block: (UIView, inout Bool) -> Void) {
        for subview in subviews {
            var stop: Bool = false
            block(subview, &stop)
            if stop {
                return
            }

            if recursively {
                subview.enumerateSubviews(recursively: recursively, using: block)
            }
        }
    }
    
}

#endif
