//
//  UIControl+EventHandler.swift
//  DGExtension
//
//  Created by Xiao Jin on 2022/6/24.
//  Copyright © 2022 debugeek. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UIControl {
    
    class UIControlEventHandlerToken: NSObject {
        private let event: UIControl.Event
        private let handler: (UIControl) -> Void
        private weak var control: UIControl?
        
        static var tokenKey: UInt8 = 0
        
        init(event: UIControl.Event, control: UIControl, handler: @escaping (UIControl) -> Void) {
            self.event = event
            self.control = control
            self.handler = handler
        }
        
        @objc func invoke(_ control: UIControl) {
            handler(control)
        }
        
        public func enable() {
            guard let control = control else {
                return
            }
            control.addTarget(self, action: #selector(invoke(_:)), for: event)
            objc_setAssociatedObject(control, &Self.tokenKey, self, .OBJC_ASSOCIATION_RETAIN)
        }
        
        public func disable() {
            guard let control = control else {
                return
            }
            control.removeTarget(self, action: #selector(invoke(_:)), for: event)
            objc_setAssociatedObject(control, &Self.tokenKey, nil, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @discardableResult
    func addEventHandler(_ handler: @escaping (UIControl) -> Void, for controlEvents: UIControl.Event) -> UIControlEventHandlerToken {
        let token = UIControlEventHandlerToken(event: controlEvents, control: self, handler: handler)
        token.enable()
        return token
    }
    
}

#endif
