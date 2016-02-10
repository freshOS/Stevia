//
//  Stevia+Position.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public extension UIView {
    
    public func left(points:CGFloat) -> UIView {
        return position(.Left, points: points)
    }
    
    public func right(points:CGFloat) -> UIView {
        return position(.Right, points: -points)
    }
    
    public func top(points:CGFloat) -> UIView {
        return position(.Top, points: points)
    }
    
    public func bottom(points:CGFloat) -> UIView {
        return position(.Bottom, points: -points)
    }
    
    private func position(position:NSLayoutAttribute, points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: position, toItem: spv, constant: points)
            spv.addConstraint(c)
        }
        return self
    }

}