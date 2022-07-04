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
    
    @objc var top: CGFloat {
        set { frame.origin.y = newValue }
        get { frame.origin.y }
    }
    
    @objc var left: CGFloat {
        set { frame.origin.x = newValue }
        get { frame.origin.x }
    }
    
    @objc var bottom: CGFloat {
        set { frame.origin.y = newValue - frame.size.height }
        get { frame.origin.y + frame.size.height }
    }

    @objc var right: CGFloat {
        set { frame.origin.x = newValue - frame.size.width }
        get { frame.origin.x + frame.size.width }
    }

    @objc var centerX: CGFloat {
        set { center.x = newValue }
        get { center.x }
    }

    @objc var centerY: CGFloat {
        set { center.y = newValue }
        get { center.y }
    }
    
    @objc var width: CGFloat {
        set { frame.size.width = newValue }
        get { frame.size.width }
    }
    
    @objc var height: CGFloat {
        set { frame.size.height = newValue }
        get { frame.size.height }
    }
    
}

public extension UIView {
    
    @discardableResult
    @objc(enumerateSubviewsRecursively:usingBlock:)
    func enumerateSubviews(recursively: Bool, using block: (UIView, UnsafeMutablePointer<Bool>) -> Void) -> Bool {
        for subview in subviews {
            var stop: Bool = false
            block(subview, &stop)
            if stop {
                return false
            }

            if recursively {
                if !subview.enumerateSubviews(recursively: recursively, using: block) {
                    return false
                }
            }
        }
        
        return true
    }
    
}

#endif
