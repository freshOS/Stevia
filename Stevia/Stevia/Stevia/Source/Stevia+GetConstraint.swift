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
        return constraintForView(self, attribute: .Left)
    }
    
    public var rightConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Right)
    }
    
    public var topConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Top)
    }
    
    public var bottomConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Bottom)
    }
    
    public var heightConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Height)
    }
    
    public var widthConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Width)
    }
    
}

func constraintForView(v:UIView, attribute:NSLayoutAttribute) -> NSLayoutConstraint? {
    if let spv = v.superview {
        for c in spv.constraints {
            if let fi = c.firstItem as? NSObject where fi == v && c.firstAttribute == attribute {
                return c
            }
            if let si = c.secondItem as? NSObject where si == v && c.secondAttribute == attribute {
                return c
            }
        }
    }
    return nil
}