//
//  Stevia+Position.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    
    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func left(points: CGFloat) -> UIView {
        return position(.Left, points: points)
    }
    
    /** Sets the right margin for a view.
     
    Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func right(points: CGFloat) -> UIView {
        return position(.Right, points: -points)
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func top(points: CGFloat) -> UIView {
        return position(.Top, points: points)
    }
    
    /** Sets the bottom margin for a view.
     
    Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func bottom(points: CGFloat) -> UIView {
        return position(.Bottom, points: -points)
    }

    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func left(fm: SteviaFlexibleMargin) -> UIView {
        return position(.Left, relatedBy:fm.relation, points: fm.points)
    }
    
    /** Sets the right margin for a view.
     
    Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func right(fm: SteviaFlexibleMargin) -> UIView {
        // For right this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .GreaterThanOrEqual {
            n.relation = .LessThanOrEqual
        }
        if fm.relation == .LessThanOrEqual {
            n.relation = .GreaterThanOrEqual
        }
        return position(.Right, relatedBy:n.relation, points: n.points)
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func top(fm: SteviaFlexibleMargin) -> UIView {
        return position(.Top, relatedBy:fm.relation, points: fm.points)
    }
    
    /** Sets the bottom margin for a view.
     
    Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     
    - Returns: Itself for chaining purposes
    */
    public func bottom(fm: SteviaFlexibleMargin) -> UIView {
        // For bottom this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .GreaterThanOrEqual {
            n.relation = .LessThanOrEqual
        }
        if fm.relation == .LessThanOrEqual {
            n.relation = .GreaterThanOrEqual
        }
        return position(.Bottom, relatedBy:n.relation, points: n.points)
    }
    
    private func position(position: NSLayoutAttribute,
                          relatedBy: NSLayoutRelation = .Equal,
                          points: CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: position,
                               toItem: spv,
                               relatedBy:relatedBy,
                               constant: points)
            spv.addConstraint(c)
        }
        return self
    }
}
