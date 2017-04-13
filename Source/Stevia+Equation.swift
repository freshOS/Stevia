//
//  Stevia+Equation.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/01/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public struct SteviaAttribute {
    let view: UIView
    let attribute: NSLayoutAttribute
    let constant: CGFloat?
    let multiplier: CGFloat?
    
    init(view: UIView, attribute: NSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
        self.constant = nil
        self.multiplier = nil
    }
    
    init(view: UIView, attribute: NSLayoutAttribute, constant: CGFloat?, multiplier: CGFloat?) {
        self.view = view
        self.attribute = attribute
        self.constant = constant
        self.multiplier = multiplier
    }
}

public extension UIView {
    
    public var Width: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .width)
    }
    
    public var Height: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .height)
    }
    
    public var Top: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .top)
    }
    
    public var Bottom: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .bottom)
    }
    
    public var Left: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .left)
    }
    
    public var Right: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .right)
    }
    
    public var CenterX: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .centerX)
    }
    
    public var CenterY: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .centerY)
    }
}

// MARK: - Equations of type v.P == v'.P' + X

@discardableResult
public func == (left: SteviaAttribute, right: SteviaAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier : multiplier,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func >= (left: SteviaAttribute, right: SteviaAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .greaterThanOrEqual,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier : multiplier,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func <= (left: SteviaAttribute, right: SteviaAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .lessThanOrEqual,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier : multiplier,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func + (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    return SteviaAttribute(view: left.view, attribute: left.attribute, constant: right, multiplier: left.multiplier)
}

@discardableResult
public func - (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    return SteviaAttribute(view: left.view, attribute: left.attribute, constant: -right, multiplier: left.multiplier)
}

@discardableResult
public func * (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    return SteviaAttribute(view: left.view, attribute: left.attribute, constant:left.constant, multiplier: right)
}

@discardableResult
public func / (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    return left * (1/right)
}

@discardableResult
public func % (left: CGFloat, right: SteviaAttribute) -> SteviaAttribute {
    return right * (left/100)
}

// MARK: - Equations of type v.P == X

@discardableResult
public func == (left: SteviaAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        var toItem: UIView? = spv
        var constant: CGFloat = right
        if left.attribute == .width || left.attribute == .height {
            toItem = nil
        }
        if left.attribute == .bottom || left.attribute == .right {
            constant = -constant
        }
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 toItem: toItem,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func >= (left: SteviaAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .greaterThanOrEqual,
                                 toItem: spv,
                                 constant:right)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func <= (left: SteviaAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .lessThanOrEqual,
                                 toItem: spv,
                                 constant:right)
    }
    return NSLayoutConstraint()
}
