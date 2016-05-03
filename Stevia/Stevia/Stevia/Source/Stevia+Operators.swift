//
//  Stevia+Operators.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

prefix operator | {}
public prefix func | (p:UIView) -> UIView {
    return p.left(0)
}

postfix operator | {}
public postfix func | (p:UIView) -> UIView {
    return p.right(0)
}


infix operator ~ {}

public func ~ (left: UIView, right: CGFloat) -> UIView {
    return left.height(right)
}

public func ~ (left: UIView, right: SteviaFlexibleMargin) -> UIView {
    return left.height(right)
}

public func ~ (left: [UIView], right: CGFloat) -> [UIView] {
    for l in left { l.height(right) }
    return left
}

public func ~ (left: [UIView], right: SteviaFlexibleMargin) -> [UIView] {
    for l in left { l.height(right) }
    return left
}

prefix operator |- {}
public prefix func |- (p: CGFloat) -> SideConstraint {
    var s = SideConstraint()
    s.constant = p
    return s
}

public prefix func |- (v: UIView) -> UIView {
    v.left(8)
    return v
}


postfix operator -| {}
public postfix func -| (p: CGFloat) -> SideConstraint {
    var s = SideConstraint()
    s.constant = p
    return s
}

public postfix func -| (v: UIView) -> UIView {
    v.right(8)
    return v
}

public struct SideConstraint {
    var constant:CGFloat!
}


public struct PartialConstraint {
    var view1:UIView!
    var constant:CGFloat!
    var views:[UIView]?
}

public func - (left: UIView, right: CGFloat) -> PartialConstraint {
    var p = PartialConstraint()
    p.view1 = left
    p.constant = right
    return p
}

// Side Constraints

public func - (left: SideConstraint, right: UIView) -> UIView {
    if let spv = right.superview {
        let c = constraint(item: right, attribute: .Left, toItem: spv, attribute: .Left, constant: left.constant)
        spv.addConstraint(c)
    }
    return right
}


public func - (left: [UIView], right: SideConstraint) -> [UIView] {
    let lastView = left[left.count-1]
    if let spv = lastView.superview {
        let c = constraint(item: lastView, attribute: .Right, toItem: spv, attribute: .Right, constant: -right.constant)
        spv.addConstraint(c)
    }
    return left
}


public func - (left:UIView, right: SideConstraint) -> UIView {
    if let spv = left.superview {
        let c = constraint(item: left, attribute: .Right, toItem: spv, attribute: .Right, constant: -right.constant)
        spv.addConstraint(c)
    }
    return left
}


public func - (left: PartialConstraint, right: UIView) -> [UIView] {
    if let views = left.views {
        if let spv = right.superview {
            let lastView = views[views.count-1]
            let c = constraint(item: lastView, attribute: .Right, toItem: right, attribute: .Left, constant: -left.constant)
            spv.addConstraint(c)
        }
        
        return  views + [right]
    } else {
        // were at the end?? nooope?/?
        if let spv = right.superview {
            let c = constraint(item: left.view1, attribute: .Right, toItem: right, attribute: .Left, constant: -left.constant)
            spv.addConstraint(c)
        }
        return  [left.view1, right]
    }
}

public func - (left: UIView, right: UIView) -> [UIView] {
    if let spv = left.superview {
        let c = constraint(item: right, attribute: .Left, toItem: left, attribute: .Right, constant: 8)
        spv.addConstraint(c)
    }
    return [left,right]
}

public func - (left: [UIView], right: CGFloat) -> PartialConstraint {
    var p = PartialConstraint()
    p.constant = right
    p.views = left
    return p
}

public func - (left: [UIView], right: UIView) -> [UIView] {
    let lastView = left[left.count-1]
    if let spv = lastView.superview {
        let c = constraint(item: lastView, attribute: .Right, toItem: right, attribute: .Left, constant: -8)
        spv.addConstraint(c)
    }
    return left + [right]
}


//// Test space in Horizointal layout ""
public struct Space {
    var previousViews:[UIView]!
}

public func - (left: UIView, right: String) -> Space {
    return Space(previousViews: [left])
}

public func - (left: [UIView], right: String) -> Space {
    return Space(previousViews: left)
}

public func - (left: Space, right: UIView) -> [UIView] {
    var va = left.previousViews
    va.append(right)
    return va
}
