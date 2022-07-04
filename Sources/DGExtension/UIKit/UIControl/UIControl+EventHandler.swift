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
        private var event: UIControl.Event
        private weak var control: UIControl?
        private var handler: (UIControl) -> Void
        
        private struct AssociatedKeys {
            static var eventHandlerToken: UInt8 = 0
        }
        
        fileprivate init(event: UIControl.Event, control: UIControl, handler: @escaping (UIControl) -> Void) {
            self.event = event
            self.control = control
            self.handler = handler
        }
        
        @objc fileprivate func invoke(_ control: UIControl) {
            handler(control)
        }
        
        @objc public func enable() {
            guard let control = control else {
                return
            }
            control.addTarget(self, action: #selector(Self.invoke(_:)), for: event)
            objc_setAssociatedObject(control, &AssociatedKeys.eventHandlerToken, self, .OBJC_ASSOCIATION_RETAIN)
        }
        
        @objc public func disable() {
            guard let control = control else {
                return
            }
            control.removeTarget(self, action: #selector(Self.invoke(_:)), for: event)
            objc_setAssociatedObject(control, &AssociatedKeys.eventHandlerToken, nil, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @discardableResult
    @objc(addEventHandler:forControlEvents:)
    func addEventHandler(_ handler: @escaping (UIControl) -> Void, for controlEvents: UIControl.Event) -> UIControlEventHandlerToken {
        let token = UIControlEventHandlerToken(event: controlEvents, control: self, handler: handler)
        token.enable()
        return token
    }
    
}

#endif
