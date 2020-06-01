//  
//  UIView.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/5/16.
//  Copyright © 2020 debugeek. All rights reserved.
//

import UIKit

public extension UIView {
    
    var top: CGFloat {
        set {
            frame.origin.y = newValue
        } get {
            return frame.origin.y
        }
    }
    
    var left: CGFloat {
        set {
            frame.origin.x = newValue
        } get {
            return frame.origin.x
        }
    }
    
    var bottom: CGFloat {
        set {
            frame.origin.y = newValue - frame.size.height
        } get {
            return frame.origin.y + frame.size.height
        }
    }

    var right: CGFloat {
        set {
            frame.origin.x = newValue - frame.size.width
        } get {
            return frame.origin.x + frame.size.width
        }
    }

    var centerX: CGFloat {
        set {
            center.x = newValue
        } get {
            return center.x
        }
    }

    var centerY: CGFloat {
        set {
            center.y = newValue
        } get {
            return center.y
        }
    }
    
    var width: CGFloat {
        set {
            frame.size.width = newValue
        } get {
            return frame.size.width
        }
    }
    
    var height: CGFloat {
        set {
            frame.size.height = newValue
        } get {
            return frame.size.height
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

