//
//  Stevia+Size.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public extension UIView {
    
    public func size(points:CGFloat) -> UIView {
        width(points)
        height(points)
        return self
    }
    
    public func height(points:CGFloat) -> UIView {
        return size(.Height, points: points)
    }
    
    public func width(points:CGFloat) -> UIView {
        return size(.Width, points: points)
    }
    
    private func size(attribute:NSLayoutAttribute, points:CGFloat) -> UIView {
        let c = constraint(item: self, attribute:attribute, constant: points)
        addConstraint(c)
        return self
    }
    
}