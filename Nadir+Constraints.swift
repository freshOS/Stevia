//
//  Nadir+Constraints.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

// MARK: - Shortcut


extension UIView {
    
    //Todo use shurtcut everywhere (DRY)
    func c(item view1: AnyObject,
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

// MARK: - Alignment

func alignHorizontally(v1:UIView, with v2:UIView) {
    if let spv = v1.superview {
        let c = NSLayoutConstraint(item: v1, attribute: .CenterY, relatedBy: .Equal, toItem: v2, attribute: .CenterY, multiplier: 1, constant: 0)
        spv.addConstraint(c)
    }
}

func alignHorizontally(views:[UIView]) {
    for (i,v) in views.enumerate() {
        if views.count > i+1 {
            let v2 = views[i+1]
            alignHorizontally(v, with: v2)
        }
    }
}

func alignVertically(v1:UIView, with v2:UIView) {
    if let spv = v1.superview {
        let c = NSLayoutConstraint(item: v1, attribute: .CenterX, relatedBy: .Equal, toItem: v2, attribute: .CenterX, multiplier: 1, constant: 0)
        spv.addConstraint(c)
    }
}

func fillHorizontally(v:UIView) {
    if let spv = v.superview {
        let c1 = NSLayoutConstraint(item: v, attribute: .Left, relatedBy: .Equal, toItem: spv, attribute: .Left, multiplier: 1, constant: 0)
        let c2 = NSLayoutConstraint(item: v, attribute: .Right, relatedBy: .Equal, toItem: spv, attribute: .Right, multiplier: 1, constant: 0)
        spv.addConstraints([c1,c2])
    }
}

func alignCenter(v1:UIView, with v2:UIView) {
    alignHorizontally(v1, with: v2)
    alignVertically(v1, with: v2)
}

// MARK: - Size

extension UIView {
    
    func height(points:CGFloat) -> UIView {
        let c = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: points)
        addConstraint(c)
        return self
    }
    
    func width(points:CGFloat) -> UIView {
        let c = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: points)
        addConstraint(c)
        return self
    }
    
    func size(points:CGFloat) -> UIView {
        width(points)
        height(points)
        return self
    }
}

// MARK: - Position

extension UIView {

    func left(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = NSLayoutConstraint(item: self, attribute: .Left, relatedBy: .Equal, toItem: spv, attribute: .Left, multiplier: 1, constant: points)
            spv.addConstraint(c)
        }
        return self
    }
    
    func right(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: spv, attribute: .Right, multiplier: 1, constant: -points)
            spv.addConstraint(c)
        }
        return self
    }
    
    func top(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: spv, attribute: .Top, multiplier: 1, constant: points)
            spv.addConstraint(c)
        }
        return self
    }
    
    func bottom(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: spv, attribute: .Bottom, multiplier: 1, constant: -points)
            spv.addConstraint(c)
        }
        return self
    }
    
    func minimumBottomSpace(points:CGFloat) -> UIView {
        if let spv = superview {
            let c = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .LessThanOrEqual, toItem: spv, attribute: .Bottom, multiplier: 1, constant: -points)
            spv.addConstraint(c)
        }
        return self
    }
    
    
    func margin(top top:CGFloat? = nil, right:CGFloat? = nil, bottom:CGFloat? = nil, left:CGFloat? = nil) -> UIView {
        if let t = top {
            self.top(t)
        }
        
        if let r = right {
            self.right(r)
        }
        
        if let b = bottom {
            self.bottom(b)
        }
        
        if let l = left {
            self.left(l)
        }
        return self
    }
    
    func fillH(m points:CGFloat = 0) -> UIView {
        if let spv = superview {
            let c1 = NSLayoutConstraint(item: self, attribute: .Left, relatedBy: .Equal, toItem: spv, attribute: .Left, multiplier: 1, constant: points)
            let c2 = NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: spv, attribute: .Right, multiplier: 1, constant: -points)
            spv.addConstraints([c1,c2])
        }
        return self
    }
    
    func fillV(m points:CGFloat = 0) -> UIView {
        if let spv = superview {
            let c1 = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: spv, attribute: .Top, multiplier: 1, constant: points)
            let c2 = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: spv, attribute: .Bottom, multiplier: 1, constant: -points)
            spv.addConstraints([c1,c2])
        }
        return self
    }
    
}

// MARK: - Stacks

extension UIView {

    func stackH(m points:CGFloat = 0, v:UIView) -> UIView {
        if let spv = superview {
            let c = NSLayoutConstraint(item: v, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
    
    func stackV(m points:CGFloat = 0, v:UIView) -> UIView {
        if let spv = superview {
            let c = NSLayoutConstraint(item: v, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
}


//MARK: - Other 

extension UIView {
    func fillContainer() {
        if let spv = superview {
            let cs = [
                NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: spv, attribute: .Top, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: spv, attribute: .Right, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: spv, attribute: .Bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self, attribute: .Left, relatedBy: .Equal, toItem: spv, attribute: .Left, multiplier: 1, constant: 0)
            ]
            spv.addConstraints(cs)
        }
    }

    func followEdges(otherView:UIView) {
        if let spv = superview {
            let cs = [
                NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: otherView, attribute: .Top, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self, attribute: .Right, relatedBy: .Equal, toItem: otherView, attribute: .Right, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: otherView, attribute: .Bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self, attribute: .Left, relatedBy: .Equal, toItem: otherView, attribute: .Left, multiplier: 1, constant: 0)
            ]
            spv.addConstraints(cs)
        }
    }

    func heightEqualsWidth() {
        if let spv = superview {
            let c = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1, constant: 0)
            spv.addConstraint(c)
        }
    }

}