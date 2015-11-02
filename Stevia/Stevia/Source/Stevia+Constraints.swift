//
//  Stevia+Constraints.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
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
public func ~ (left: CGFloat, right: UIView) -> UIView {
    return right.height(left)
}

public func ~ (left: UIView, right: CGFloat) -> UIView {
    return left.height(right)
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

//public func - (left: PartialConstraint, right: UIView) -> [UIView] {
//    if let spv = right.superview {
//        let c = constraint(item: left.view1, attribute: .Right, toItem: right, attribute: .Left, constant: -left.constant)
//        spv.addConstraint(c)
//    }
//    return  [left.view1, right]
//}

///TEST

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



// MARK: - Shortcut


public extension UIView {
    
    public func c(item view1: AnyObject,
        attribute attr1: NSLayoutAttribute,
        relatedBy: NSLayoutRelation = .Equal,
        toItem view2: AnyObject? = nil,
        attribute attr2: NSLayoutAttribute? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0) -> NSLayoutConstraint {
            let c = NSLayoutConstraint(item: view1, attribute: attr1, relatedBy: relatedBy, toItem: view2, attribute: ((attr2 == nil) ? attr1 : attr2! ), multiplier: multiplier, constant: constant)
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

// MARK: - Alignment

public func alignHorizontally(v1:UIView, with v2:UIView) {
    if let spv = v1.superview {
        let c = constraint(item: v1, attribute: .CenterY, toItem: v2)
        spv.addConstraint(c)
    }
}

public func alignHorizontally(views:[UIView]) {
    for (i,v) in views.enumerate() {
        if views.count > i+1 {
            let v2 = views[i+1]
            alignHorizontally(v, with: v2)
        }
    }
}

public func alignVertically(v1:UIView, with v2:UIView) {
    if let spv = v1.superview {
        let c = constraint(item: v1, attribute: .CenterX, toItem: v2)
        spv.addConstraint(c)
    }
}

public func alignVertically(views:[UIView]) {
    for (i,v) in views.enumerate() {
        if views.count > i+1 {
            let v2 = views[i+1]
            alignVertically(v, with: v2)
        }
    }
}

public func fillHorizontally(v:UIView) {
    if let spv = v.superview {
        let c1 = constraint(item: v, attribute: .Left, toItem: spv)
        let c2 = constraint(item: v, attribute: .Right, toItem: spv)
        spv.addConstraints([c1,c2])
    }
}

public func alignCenter(v1:UIView, with v2:UIView) {
    alignHorizontally(v1, with: v2)
    alignVertically(v1, with: v2)
}

// MARK: - Size

public extension UIView {
    
    public func height(points:CGFloat) -> UIView {
        let c = constraint(item: self, attribute: .Height, constant: points)
        addConstraint(c)
        return self
    }
    
    public func width(points:CGFloat) -> UIView {
        let c = constraint(item: self, attribute: .Width, constant: points)
        addConstraint(c)
        return self
    }
    
    public func size(points:CGFloat) -> UIView {
        width(points)
        height(points)
        return self
    }
}

// MARK: - Position

public extension UIView {
    
    public func left(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Left, toItem: spv, constant: points)
            spv.addConstraint(c)
        }
        return self
    }
    
    public func right(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Right, toItem: spv, constant: -points)
            spv.addConstraint(c)
        }
        return self
    }
    
    public func top(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Top, toItem: spv, constant: points)
            spv.addConstraint(c)
        }
        return self
    }
    
    public func bottom(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Bottom, toItem: spv, constant: -points)
            spv.addConstraint(c)
        }
        return self
    }
    
    public func minimumBottomSpace(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Bottom, relatedBy: .LessThanOrEqual, toItem: spv, attribute: .Bottom, constant: -points)
            spv.addConstraint(c)
        }
        return self
    }
    
    public func fillH(m points:CGFloat = 0) -> UIView {
        if let spv = superview {
            let c1 = constraint(item: self, attribute: .Left, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: .Right, toItem: spv, constant: -points)
            spv.addConstraints([c1,c2])
        }
        return self
    }
    
    public func fillV(m points:CGFloat = 0) -> UIView {
        if let spv = superview {
            let c1 = constraint(item: self, attribute: .Top, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: .Bottom, toItem: spv, constant: -points)
            spv.addConstraints([c1,c2])
        }
        return self
    }
    
    public func centerInContainer() {
        if let spv = superview {
            alignCenter(self, with: spv)
        }
    }
    
    public func centerHorizontallyInContainer() {
        if let spv = superview {
            alignVertically(self, with: spv)
        }
    }
    
    public func centerVerticallyInContainer() {
        if let spv = superview {
            alignHorizontally(self, with: spv)
        }
    }
}

// MARK: - Stacks

public extension UIView {
    
    public func stackH(m points:CGFloat = 0, v:UIView) -> UIView {
        if let spv = superview {
            let c = constraint(item: v, attribute: .Left, toItem: self, attribute: .Right, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
    
    public func layout(objects:[AnyObject]) -> [UIView] {
        return stackV(objects)
    }
    
    public func stackV(m points:CGFloat = 0, v:UIView) -> UIView {
        if let spv = superview {
            let c = constraint(item: v, attribute: .Top, toItem: self, attribute: .Bottom, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
    
    
    // # MAGICK cant you see the matrix?????  10101010100001100010101
    
    public func stackV(objects:[AnyObject]) -> [UIView] {
        var previousMargin:CGFloat? = nil
        for (i,o) in objects.enumerate() {
            if let v = o as? UIView {
                if let pm = previousMargin {
                    if i == 1 {
                        v.top(pm) // only if first view
                    } else {
                        let vx = objects[i-2] as! UIView
                        vx.stackV(m:pm, v:v)
                    }
                    previousMargin = nil
                } else {
                    
                    if i != 0 {
                        if let previousView = objects[i-1] as? UIView {
                            previousView.stackV(v: v) // Stacks two consecutive views
                        }
                    }
                }
            } else if let m = o as? CGFloat {
                previousMargin = m // Store margin for next pass
                
                if i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.bottom(m)
                    }
                }
            }
        }
        return objects.filter {$0 is UIView } as! [UIView]
    }
    
    public func stackH(objects:[AnyObject]) -> [UIView] {
        var previousMargin:CGFloat? = nil
        for (i,o) in objects.enumerate() {
            if let v = o as? UIView {
                if let pm = previousMargin {
                    if i == 1 {
                        v.left(pm) // only if first view
                    } else {
                        print(objects[i-2])
                        let vx = objects[i-2] as! UIView
                        vx.stackH(m:pm, v:v)
                        //                        if let v2 = objects[i+1] as? UIView {
                        //                            v.stackV(m:8, v: v2)
                        //                        }
                    }
                    previousMargin = nil
                } else {
                    
                    if i != 0 {
                        if let previousView = objects[i-1] as? UIView {
                            previousView.stackH(v: v) // Stacks two consecutive views
                        }
                    }
                }
            } else if let m = o as? CGFloat {
                previousMargin = m // Store margin for next pass
                
                if i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.right(m)
                    }
                }
            }
        }
        
        return objects.filter {$0 is UIView } as! [UIView]
    }
    
}


//MARK: - Other

public extension UIView {
    public func fillContainer(padding:CGFloat = 0) {
        if let spv = superview {
            let cs = [
                constraint(item: self, attribute: .Top, toItem: spv, constant: padding),
                constraint(item: self, attribute: .Right, toItem: spv, constant: -padding),
                constraint(item: self, attribute: .Bottom, toItem: spv, constant: -padding),
                constraint(item: self, attribute: .Left, toItem: spv, constant: padding)
            ]
            spv.addConstraints(cs)
        }
    }
    
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
    
    public func heightEqualsWidth() {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Height, toItem: self, attribute: .Width)
            spv.addConstraint(c)
        }
    }
    
}

public func H(points:CGFloat) -> (v:UIView) -> UIView {
    return { v in
        return v.height(points)
    }
}

public func margin(x:CGFloat) -> CGFloat {
    return x
}