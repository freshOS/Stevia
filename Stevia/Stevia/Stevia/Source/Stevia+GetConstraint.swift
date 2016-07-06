//
//  Stevia+GetConstraint.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 12/03/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public extension UIView {
    
    public var leftConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Left, existsOnView: self.superview)
    }
    
    public var rightConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Right, existsOnView: self.superview)
    }
    
    public var topConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Top, existsOnView: self.superview)
    }
    
    public var bottomConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Bottom, existsOnView: self.superview)
    }
    
    public var heightConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Height, existsOnView: self)
    }
    
    public var widthConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Width, existsOnView: self)
    }
    
    public var trailingConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Trailing, existsOnView: self.superview)
    }
    
    public var leadingConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Leading, existsOnView: self.superview)
    }
    
}

func constraintForView(v:UIView, attribute:NSLayoutAttribute, existsOnView:UIView?) -> NSLayoutConstraint? {
    let target = existsOnView ?? v
    for c in target.constraints {
        if let fi = c.firstItem as? NSObject where fi == v && c.firstAttribute == attribute {
            return c
        }
        if let si = c.secondItem as? NSObject where si == v && c.secondAttribute == attribute {
            return c
        }
    }
    return nil
}