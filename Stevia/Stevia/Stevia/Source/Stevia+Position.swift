//
//  Stevia+Position.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

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
    
    ///
    public func left(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Left, relatedBy:fm.relation, points: fm.points)
    }
    
    public func right(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Right, relatedBy:fm.relation, points: -fm.points)
    }
    
    public func top(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Top, relatedBy:fm.relation, points: fm.points)
    }
    
    public func bottom(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Bottom, relatedBy:fm.relation, points: -fm.points)
    }
    
    ///
    
    private func position(position:NSLayoutAttribute, relatedBy:NSLayoutRelation = .Equal, points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: position, toItem: spv, relatedBy:relatedBy, constant: points)
            spv.addConstraint(c)
        }
        return self
    }

}