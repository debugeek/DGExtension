//
//  UIBarButtonItem+ActionBlock.swift
//  DGExtension
//
//  Created by Xiao Jin on 2022/7/8.
//  Copyright © 2022 debugeek. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UIBarButtonItem {

    static var actionBlockKey: UInt = 0
    
    @objc convenience init(title: String?, style: UIBarButtonItem.Style, actionBlock: @escaping (UIBarButtonItem) -> Void) {
        self.init(title: title, style: style, target: nil, action: nil)
        action = #selector(invoke)
        objc_setAssociatedObject(self, &Self.actionBlockKey, actionBlock, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc convenience init(image: UIImage?, style: UIBarButtonItem.Style, actionBlock: @escaping (UIBarButtonItem) -> Void) {
        self.init(image: image, style: style, target: nil, action: nil)
        action = #selector(invoke)
        objc_setAssociatedObject(self, &Self.actionBlockKey, actionBlock, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc convenience init(barButtonSystemItem systemItem: UIBarButtonItem.SystemItem, actionBlock: @escaping (UIBarButtonItem) -> Void) {
        self.init(barButtonSystemItem: systemItem, target: nil, action: nil)
        action = #selector(invoke)
        objc_setAssociatedObject(self, &Self.actionBlockKey, actionBlock, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: UIBarButtonItem.Style, actionBlock: @escaping (UIBarButtonItem) -> Void) {
        self.init(image: image, landscapeImagePhone: landscapeImagePhone, style: style, target: nil, action: nil)
        action = #selector(invoke)
        objc_setAssociatedObject(self, &Self.actionBlockKey, actionBlock, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc private func invoke(_ item: UIBarButtonItem) {
        guard let actionBlock = objc_getAssociatedObject(self, &Self.actionBlockKey) as? (UIBarButtonItem) -> Void else {
            return
        }
        actionBlock(item)
    }
    
}

#endif
