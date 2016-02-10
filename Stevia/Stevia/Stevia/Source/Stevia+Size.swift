//
//  Stevia+Size.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

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