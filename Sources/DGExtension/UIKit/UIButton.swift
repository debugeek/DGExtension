//  
//  UIButton.swift
//  DGExtension
//
//  Created by Xiao Jin on 2020/5/16.
//  Copyright © 2020 debugeek. All rights reserved.
//

import UIKit
import swiftRuntime

public extension UIButton {
    
    enum UIButtonImagePosition {
        case left
        case right
        case top
        case bottom
    }
    
    private static let imagePosition = ObjectAssociation<UIButtonImagePosition>()
    var imagePosition: UIButtonImagePosition? {
        get { return UIButton.imagePosition[self] }
        set {
            UIButton.imagePosition[self] = newValue
            updateEdgeInsetsIfNeeded()
        }
    }
    
    private static let imageSpacing = ObjectAssociation<CGFloat>()
    var imageSpacing: CGFloat? {
        get { return UIButton.imageSpacing[self] }
        set {
            UIButton.imageSpacing[self] = newValue
            updateEdgeInsetsIfNeeded()
        }
    }
    
    private func updateEdgeInsetsIfNeeded() {
        guard let position = imagePosition else {
            return
        }
        
        let spacing = imageSpacing ?? 2
        
        var titleSize = CGSize.zero
        var imageSize = CGSize.zero
        
        if let title = self.title(for: state), let font = titleLabel?.font {
            titleSize = (title as NSString).boundingRect(with: bounds.size, options: [NSStringDrawingOptions.usesLineFragmentOrigin, NSStringDrawingOptions.truncatesLastVisibleLine], attributes: [NSAttributedString.Key.font : font], context: nil).size
        }
        
        if let image = self.image(for: state) {
            imageSize = image.size
        }
        
        let totalHeight = imageSize.height + spacing + titleSize.height
        
        switch position {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -(totalHeight - imageSize.height), left: 0, bottom: 0, right: -titleSize.width)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(totalHeight - titleSize.height), right: 0)
            
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: (titleSize.height + spacing)/2, left: imageSize.width/2, bottom: -(titleSize.height + spacing)/2, right: -imageSize.width/2)
            titleEdgeInsets = UIEdgeInsets(top: -(imageSize.height + spacing)/2, left: -titleSize.width/2, bottom: (imageSize.height + spacing)/2, right: titleSize.width/2)
            
        case .left:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: spacing/2);
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2);
            
        case .right:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageSize.width + spacing/2), bottom: 0, right: imageSize.width + spacing/2);
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleSize.width + spacing/2, bottom: 0, right: -(titleSize.width + spacing/2));
        }
        
        setNeedsLayout()
    }
    
}
