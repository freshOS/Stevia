//
//  Stevia+Equation.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/01/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public struct SteviaAttribute {
    let view: UIView
    let attribute: NSLayoutConstraint.Attribute
    let constant: Double?
    let multiplier: Double?
    
    init(view: UIView, attribute: NSLayoutConstraint.Attribute) {
        self.view = view
        self.attribute = attribute
        self.constant = nil
        self.multiplier = nil
    }
    
    init(view: UIView, attribute: NSLayoutConstraint.Attribute, constant: Double?, multiplier: Double?) {
        self.view = view
        self.attribute = attribute
        self.constant = constant
        self.multiplier = multiplier
    }
}

public extension UIView {
    
    var Width: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .width)
    }
    
    var Height: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .height)
    }
    
    var Top: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .top)
    }
    
    var Bottom: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .bottom)
    }
    
    var Left: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .left)
    }
    
    var Right: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .right)
    }
    
    var Leading: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .leading)
    }
    
    var Trailing: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .trailing)
    }
    
    var CenterX: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .centerX)
    }
    
    var CenterY: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .centerY)
    }
    
    var FirstBaseline: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .firstBaseline)
    }
    
    var LastBaseline: SteviaAttribute {
        return SteviaAttribute(view: self, attribute: .lastBaseline)
    }
}

// MARK: - Equations of type v.P == v'.P' + X

@discardableResult
public func == (left: SteviaAttribute, right: SteviaAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? left.constant ?? 0
    let multiplier = right.multiplier ?? left.multiplier ?? 1

    if left.view.superview == right.view.superview { // A and B are at the same level
        // Old code
        if let spv = left.view.superview {
            return spv.addConstraint(item: left.view,
                                     attribute: left.attribute,
                                     toItem: right.view,
                                     attribute: right.attribute,
                                     multiplier: multiplier,
                                     constant: constant)
        }
    } else if left.view.superview == right.view { // A is in B (first level)
        return right.view.addConstraint(item: left.view,
                                        attribute: left.attribute,
                                        toItem: right.view,
                                        attribute: right.attribute,
                                        multiplier: multiplier,
                                        constant: constant)
    } else if right.view.superview == left.view { // B is in A (first level)
        return left.view.addConstraint(item: right.view,
                                       attribute: right.attribute,
                                       toItem: left.view,
                                       attribute: left.attribute,
                                       multiplier: multiplier,
                                       constant: constant)
    } else if left.view.isDescendant(of: right.view) { // A is in B (LOW level)
        return right.view.addConstraint(item: left.view,
                                        attribute: left.attribute,
                                        toItem: right.view,
                                        attribute: right.attribute,
                                        multiplier: multiplier,
                                        constant: constant)
    } else if right.view.isDescendant(of: left.view) { // B is in A (LOW level)
        return left.view.addConstraint(item: left.view,
                                       attribute: left.attribute,
                                       toItem: right.view,
                                       attribute: right.attribute,
                                       multiplier: multiplier,
                                       constant: constant)
    } else if let commonParent = commonParent(with: left.view, and: right.view) { // Look for common ancestor
        return commonParent.addConstraint(item: left.view,
                                          attribute: left.attribute,
                                          toItem: right.view,
                                          attribute: right.attribute,
                                          multiplier: multiplier,
                                          constant: constant)
    }
    
    return NSLayoutConstraint()
}

func commonParent(with viewA: UIView, and viewB: UIView) -> UIView? {
    
    // Both views should have a superview
    guard viewA.superview != nil && viewB.superview != nil else {
        return nil
    }
    
    // Find the common parent
    var spv = viewA.superview
    while spv != nil {
        if viewA.isDescendant(of: spv!) && viewB.isDescendant(of: spv!) {
            return spv
        } else {
            spv = spv?.superview
        }
    }
    return nil
}

@discardableResult
public func >= (left: SteviaAttribute, right: SteviaAttribute) -> NSLayoutConstraint {
    return applyRelation(left: left, right: right, relateBy: .greaterThanOrEqual)
}

@discardableResult
public func <= (left: SteviaAttribute, right: SteviaAttribute) -> NSLayoutConstraint {
    return applyRelation(left: left, right: right, relateBy: .lessThanOrEqual)
}

private func applyRelation(left: SteviaAttribute, right: SteviaAttribute, relateBy: NSLayoutConstraint.Relation) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: relateBy,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier: multiplier,
                                 constant: constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func + (left: SteviaAttribute, right: Double) -> SteviaAttribute {
    SteviaAttribute(view: left.view, attribute: left.attribute, constant: right, multiplier: left.multiplier)
}

@discardableResult
public func + (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    left + Double(right)
}

@discardableResult
public func + (left: SteviaAttribute, right: Int) -> SteviaAttribute {
    left + Double(right)
}

@discardableResult
public func - (left: SteviaAttribute, right: Double) -> SteviaAttribute {
    SteviaAttribute(view: left.view, attribute: left.attribute, constant: -right, multiplier: left.multiplier)
}

@discardableResult
public func - (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    left - Double(right)
}

@discardableResult
public func - (left: SteviaAttribute, right: Int) -> SteviaAttribute {
    left - Double(right)
}

@discardableResult
public func * (left: SteviaAttribute, right: Double) -> SteviaAttribute {
    SteviaAttribute(view: left.view, attribute: left.attribute, constant: left.constant, multiplier: right)
}

@discardableResult
public func * (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    left * Double(right)
}

@discardableResult
public func * (left: SteviaAttribute, right: Int) -> SteviaAttribute {
    left * Double(right)
}

@discardableResult
public func / (left: SteviaAttribute, right: Double) -> SteviaAttribute {
    left * (1/right)
}

@discardableResult
public func / (left: SteviaAttribute, right: CGFloat) -> SteviaAttribute {
    left / Double(right)
}

@discardableResult
public func / (left: SteviaAttribute, right: Int) -> SteviaAttribute {
    left / Double(right)
}


@discardableResult
public func % (left: Double, right: SteviaAttribute) -> SteviaAttribute {
    right * (left/100)
}

@discardableResult
public func % (left: CGFloat, right: SteviaAttribute) -> SteviaAttribute {
    Double(left) % right
}

@discardableResult
public func % (left: Int, right: SteviaAttribute) -> SteviaAttribute {
    Double(left) % right
}


// MARK: - Equations of type v.P == X

@discardableResult
public func == (left: SteviaAttribute, right: Double) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        var toItem: UIView? = spv
        var constant = right
        if left.attribute == .width || left.attribute == .height {
            toItem = nil
        }
        if left.attribute == .bottom || left.attribute == .right {
            constant = -constant
        }
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 toItem: toItem,
                                 constant: Double(constant))
    }
    return NSLayoutConstraint()
}

@discardableResult
public func == (left: SteviaAttribute, right: CGFloat) -> NSLayoutConstraint {
    left == Double(right)
}

@discardableResult
public func == (left: SteviaAttribute, right: Int) -> NSLayoutConstraint {
    left == Double(right)
}

@discardableResult
public func >= (left: SteviaAttribute, right: Double) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        var toItem: UIView? = spv
        var constant = right
        if left.attribute == .width || left.attribute == .height {
            toItem = nil
        }
        if left.attribute == .bottom || left.attribute == .right {
            constant = -constant
        }
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .greaterThanOrEqual,
                                 toItem: toItem,
                                 constant: Double(constant))
    }
    return NSLayoutConstraint()
}

@discardableResult
public func >= (left: SteviaAttribute, right: CGFloat) -> NSLayoutConstraint {
    left >= Double(right)
}

@discardableResult
public func >= (left: SteviaAttribute, right: Int) -> NSLayoutConstraint {
    left >= Double(right)
}

@discardableResult
public func <= (left: SteviaAttribute, right: Double) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        var toItem: UIView? = spv
        var constant = right
        if left.attribute == .width || left.attribute == .height {
            toItem = nil
        }
        if left.attribute == .bottom || left.attribute == .right {
            constant = -constant
        }
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .lessThanOrEqual,
                                 toItem: toItem,
                                 constant: Double(constant))
    }
    return NSLayoutConstraint()
}

@discardableResult
public func <= (left: SteviaAttribute, right: CGFloat) -> NSLayoutConstraint {
    left <= Double(right)
}

@discardableResult
public func <= (left: SteviaAttribute, right: Int) -> NSLayoutConstraint {
    left <= Double(right)
}
#endif
