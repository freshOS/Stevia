//
//  Stevia+Constraints.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

// MARK: - Shortcut

public extension UIView {
    
    public func c(item view1: AnyObject,
        attribute attr1: NSLayoutAttribute,
        relatedBy: NSLayoutRelation = .Equal,
        toItem view2: AnyObject? = nil,
        attribute attr2: NSLayoutAttribute? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0) -> NSLayoutConstraint {
            let c = constraint(item: view1, attribute: attr1, relatedBy: relatedBy, toItem: view2, attribute: attr2, multiplier: multiplier, constant: constant)
            addConstraint(c)
            return c
    }
}

public func constraint(item view1: AnyObject,
    attribute attr1: NSLayoutAttribute,
    relatedBy: NSLayoutRelation = .Equal,
    toItem view2: AnyObject? = nil,
    attribute attr2: NSLayoutAttribute? = nil, // Not an attribute??
    multiplier: CGFloat = 1,
    constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view1, attribute: attr1, relatedBy: relatedBy, toItem: view2, attribute: ((attr2 == nil) ? attr1 : attr2! ), multiplier: multiplier, constant: constant)
}

//MARK: - Other

public extension UIView {

    public func followEdges(otherView:UIView) {
        if let spv = superview {
            let cs = [
                constraint(item: self, attribute: .Top, toItem: otherView),
                constraint(item: self, attribute: .Right, toItem: otherView),
                constraint(item: self, attribute: .Bottom, toItem: otherView),
                constraint(item: self, attribute: .Left, toItem: otherView)
            ]
            spv.addConstraints(cs)
        }
    }
        
    public func heightEqualsWidth() -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Height, toItem: self, attribute: .Width)
            spv.addConstraint(c)
        }
        return self
    }
    
}