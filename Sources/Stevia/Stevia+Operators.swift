//
//  Stevia+Operators.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

prefix operator |
@discardableResult
public prefix func | (p: UIView) -> UIView {
    p.leading(0)
}

postfix operator |
@discardableResult
public postfix func | (p: UIView) -> UIView {
    p.trailing(0)
}

infix operator ~ : HeightPrecedence

precedencegroup HeightPrecedence {
    lowerThan: AdditionPrecedence
}

@discardableResult
public func ~ (left: UIView, right: Double) -> UIView {
    left.height(right)
}

@discardableResult
public func ~ (left: UIView, right: CGFloat) -> UIView {
    left ~ Double(right)
}

@discardableResult
public func ~ (left: UIView, right: Int) -> UIView {
    left ~ Double(right)
}

@discardableResult
public func ~ (left: UIView, right: SteviaPercentage) -> UIView {
    left.height(right)
}

@discardableResult
public func ~ (left: UIView, right: SteviaFlexibleMargin) -> UIView {
    left.height(right)
}

@discardableResult
public func ~ (left: [UIView], right: Double) -> [UIView] {
    for l in left { l.height(right) }
    return left
}

@discardableResult
public func ~ (left: [UIView], right: CGFloat) -> [UIView] {
    left ~ Double(right)
}

@discardableResult
public func ~ (left: [UIView], right: Int) -> [UIView] {
    left ~ Double(right)
}

@discardableResult
public func ~ (left: [UIView], right: SteviaFlexibleMargin) -> [UIView] {
    for l in left { l.height(right) }
    return left
}

prefix operator |-
@discardableResult
public prefix func |- (p: Double) -> SideConstraint {
    var s = SideConstraint()
    s.constant = p
    return s
}

@discardableResult
public prefix func |- (p: CGFloat) -> SideConstraint {
    |-Double(p)
}

@discardableResult
public prefix func |- (p: Int) -> SideConstraint {
    |-Double(p)
}

@discardableResult
public prefix func |- (v: UIView) -> UIView {
    v.leading(8)
}

postfix operator -|
@discardableResult
public postfix func -| (p: Double) -> SideConstraint {
    var s = SideConstraint()
    s.constant = p
    return s
}

@discardableResult
public postfix func -| (p: CGFloat) -> SideConstraint {
    Double(p)-|
}

@discardableResult
public postfix func -| (p: Int) -> SideConstraint {
    Double(p)-|
}

@discardableResult
public postfix func -| (v: UIView) -> UIView {
    v.trailing(8)
}

public struct SideConstraint {
    var constant: Double!
}

public struct PartialConstraint {
    var view1: UIView!
    var constant: Double!
    var views: [UIView]?
}

@discardableResult
public func - (left: UIView, right: Double) -> PartialConstraint {
    var p = PartialConstraint()
    p.view1 = left
    p.constant = right
    return p
}

@discardableResult
public func - (left: UIView, right: CGFloat) -> PartialConstraint {
    left-Double(right)
}

@discardableResult
public func - (left: UIView, right: Int) -> PartialConstraint {
    left-Double(right)
}

// Side Constraints

@discardableResult
public func - (left: SideConstraint, right: UIView) -> UIView {
    if let spv = right.superview {
        let c = constraint(item: right, attribute: .leading,
                           toItem: spv, attribute: .leading,
                           constant: left.constant)
        spv.addConstraint(c)
    }
    return right
}

@discardableResult
public func - (left: [UIView], right: SideConstraint) -> [UIView] {
    let lastView = left[left.count-1]
    if let spv = lastView.superview {
        let c = constraint(item: lastView, attribute: .trailing,
                           toItem: spv, attribute: .trailing,
                           constant: -right.constant)
        spv.addConstraint(c)
    }
    return left
}

@discardableResult
public func - (left: UIView, right: SideConstraint) -> UIView {
    if let spv = left.superview {
        let c = constraint(item: left, attribute: .trailing,
                           toItem: spv, attribute: .trailing,
                           constant: -right.constant)
        spv.addConstraint(c)
    }
    return left
}

@discardableResult
public func - (left: PartialConstraint, right: UIView) -> [UIView] {
    if let views = left.views {
        if let spv = right.superview {
            let lastView = views[views.count-1]
            let c = constraint(item: lastView, attribute: .trailing,
                               toItem: right, attribute: .leading,
                               constant: -left.constant)
            spv.addConstraint(c)
        }
        
        return  views + [right]
    } else {
        // were at the end?? nooope?/?
        if let spv = right.superview {
            let c = constraint(item: left.view1, attribute: .trailing,
                               toItem: right, attribute: .leading,
                               constant: -left.constant)
            spv.addConstraint(c)
        }
        return  [left.view1, right]
    }
}

@discardableResult
public func - (left: UIView, right: UIView) -> [UIView] {
    if let spv = left.superview {
        let c = constraint(item: right, attribute: .leading,
                           toItem: left, attribute: .trailing,
                           constant: 8)
        spv.addConstraint(c)
    }
    return [left, right]
}

@discardableResult
public func - (left: [UIView], right: Double) -> PartialConstraint {
    var p = PartialConstraint()
    p.constant = right
    p.views = left
    return p
}

@discardableResult
public func - (left: [UIView], right: CGFloat) -> PartialConstraint {
    left-Double(right)
}

@discardableResult
public func - (left: [UIView], right: Int) -> PartialConstraint {
    left-Double(right)
}


@discardableResult
public func - (left: [UIView], right: UIView) -> [UIView] {
    let lastView = left[left.count-1]
    if let spv = lastView.superview {
        let c = constraint(item: lastView, attribute: .trailing,
                           toItem: right, attribute: .leading,
                           constant: -8)
        spv.addConstraint(c)
    }
    return left + [right]
}

//// Test space in Horizointal layout ""
public struct Space {
    var previousViews: [UIView]!
}

@discardableResult
public func - (left: UIView, right: String) -> Space {
    Space(previousViews: [left])
}

@discardableResult
public func - (left: [UIView], right: String) -> Space {
    Space(previousViews: left)
}

@discardableResult
public func - (left: Space, right: UIView) -> [UIView] {
    var va = left.previousViews
    va?.append(right)
    return va!
}
#endif
