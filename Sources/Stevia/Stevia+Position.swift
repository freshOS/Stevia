//
//  Stevia+Position.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    
    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func left<T: BinaryFloatingPoint>(_ points: T) -> Self {
        position(.left, points: Double(points))
    }
    
    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func left<T: BinaryInteger>(_ points: T) -> Self {
        left(Double(points))
    }
    
    /** Sets the right margin for a view.
     
    Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     label.right(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func right<T: BinaryFloatingPoint>(_ points: T) -> Self {
        position(.right, points: -Double(points))
    }
    
    /** Sets the right margin for a view.
     
    Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     label.right(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func right<T: BinaryInteger>(_ points: T) -> Self {
        right(Double(points))
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     label.top(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func top<T: BinaryFloatingPoint>(_ points: T) -> Self {
        position(.top, points: Double(points))
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     label.top(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func top<T: BinaryInteger>(_ points: T) -> Self {
        top(Double(points))
    }
    
    /** Sets the bottom margin for a view.
     
    Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     label.bottom(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func bottom<T: BinaryFloatingPoint>(_ points: T) -> Self {
        position(.bottom, points: -Double(points))
    }
    
    /** Sets the bottom margin for a view.
     
    Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     label.bottom(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func bottom<T: BinaryInteger>(_ points: T) -> Self {
        bottom(Double(points))
    }

    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func left(_ fm: SteviaFlexibleMargin) -> Self {
        position(.left, relatedBy: fm.relation, points: fm.points)
    }
    
    /** Sets the right margin for a view.
     
    Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     label.right(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func right(_ fm: SteviaFlexibleMargin) -> Self {
        // For right this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.right, relatedBy: n.relation, points: n.points)
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     label.top(20%)
     
    - Returns: Itself for chaining purposes
     */
    @discardableResult
    func top(_ fm: SteviaFlexibleMargin) -> Self {
        position(.top, relatedBy: fm.relation, points: fm.points)
    }
    
    /** Sets the bottom margin for a view.
     
    Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     label.bottom(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    func bottom(_ fm: SteviaFlexibleMargin) -> Self {
        // For bottom this should be inverted.
        var n = SteviaFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.bottom, relatedBy: n.relation, points: n.points)
    }
    
    /** Sets the leading margin for a view.
     
    Example Usage :
     
     label.leading(20)
     label.leading(<=20)
     label.leading(>=20)
     label.leading(20%)
     
    - Returns: itself for chaining purposes
    */
    
    @discardableResult
    func leading<T: BinaryFloatingPoint>(_ points: T) -> UIView {
        position(.leading, points: Double(points))
    }
    
    /** Sets the leading margin for a view.
     
    Example Usage :
     
     label.leading(20)
     label.leading(<=20)
     label.leading(>=20)
     label.leading(20%)
     
    - Returns: itself for chaining purposes
    */
    @discardableResult
    func leading<T: BinaryInteger>(_ points: T) -> UIView {
        leading(Double(points))
    }
    
    @discardableResult
    func leading(_ fm: SteviaFlexibleMargin) -> UIView {
        position(.leading, relatedBy: fm.relation, points: fm.points)
    }
    
    /** Sets the trailing margin for a view.
     
    Example Usage :
     
     label.trailing(20)
     label.trailing(<=20)
     label.trailing(>=20)
     label.trailing(20%)
     
    - Returns: itself for chaining purposes
    */
    @discardableResult
    func trailing<T: BinaryFloatingPoint>(_ points: T) -> UIView {
        position(.trailing, points: -Double(points))
    }
    
    /** Sets the trailing margin for a view.
     
    Example Usage :
     
     label.trailing(20)
     label.trailing(<=20)
     label.trailing(>=20)
     label.trailing(20%)
     
    - Returns: itself for chaining purposes
    */
    @discardableResult
    func trailing<T: BinaryInteger>(_ points: T) -> UIView {
        trailing(Double(points))
    }

    @discardableResult
    func trailing(_ fm: SteviaFlexibleMargin) -> UIView {
        var invertedRelation = fm.relation
        if invertedRelation == .lessThanOrEqual {
            invertedRelation = .greaterThanOrEqual
        } else if invertedRelation == .greaterThanOrEqual {
            invertedRelation = .lessThanOrEqual
        }
        return position(.trailing, relatedBy: invertedRelation!, points: -fm.points)
    }
    
    fileprivate func position(_ position: NSLayoutConstraint.Attribute,
                              relatedBy: NSLayoutConstraint.Relation = .equal,
                              points: Double) -> Self {
        if let spv = superview {
            let c = constraint(item: self, attribute: position,
                               relatedBy: relatedBy,
                               toItem: spv,
                               constant: points)
            spv.addConstraint(c)
        }
        return self
    }
}
#endif
