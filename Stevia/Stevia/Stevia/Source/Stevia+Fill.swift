//
//  Stevia+Fill.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func fillContainer(padding:CGFloat = 0) {
        fillH(m: padding)
        fillV(m: padding)
    }
    
    public func fillV(m points:CGFloat = 0) -> UIView {
        return fill(.Vertical, points: points)
    }
    
    private func fillH(m points:CGFloat = 0) -> UIView {
        return fill(.Horizontal, points: points)
    }
    
    public func fill(axis:UILayoutConstraintAxis, points:CGFloat = 0) -> UIView {
        let a:NSLayoutAttribute = axis == .Vertical ? .Top : .Left
        let b:NSLayoutAttribute = axis == .Vertical ? .Bottom : .Right
        if let spv = superview {
            let c1 = constraint(item: self, attribute: a, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: b, toItem: spv, constant: -points)
            spv.addConstraints([c1,c2])
        }
        return self
    }
}