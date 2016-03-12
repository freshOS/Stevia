//
//  Stevia+GetConstraint.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 12/03/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

extension UIView {
    
    var leftConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Left)
    }
    
    var rightConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Right)
    }
    
    var topConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Top)
    }
    
    var bottomConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Bottom)
    }
    
    var heightConstraint:NSLayoutConstraint? {
        return constraintForView(self, attribute: .Height)
    }
    
    var widthConstraint:NSLayoutConstraint? {
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