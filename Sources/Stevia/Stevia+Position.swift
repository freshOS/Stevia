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
    func left(_ points: Double) -> Self {
        position(.left, points: points)
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
    func left(_ points: CGFloat) -> Self {
        left(Double(points))
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
    func left(_ points: Int) -> Self {
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
    func right(_ points: Double) -> Self {
        position(.right, points: -points)
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
    func right(_ points: CGFloat) -> Self {
        right(Double(points))
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
    func right(_ points: Int) -> Self {
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
    func top(_ points: Double) -> Self {
        position(.top, points: points)
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
    func top(_ points: CGFloat) -> Self {
        top(Double(points))
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
    func top(_ points: Int) -> Self {
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
    func bottom(_ points: Double) -> Self {
        position(.bottom, points: -points)
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
    func bottom(_ points: CGFloat) -> Self {
        bottom(Double(points))
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
    func bottom(_ points: Int) -> Self {
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
    func leading(_ points: Double) -> UIView {
        position(.leading, points: points)
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
    func leading(_ points: CGFloat) -> UIView {
        leading(Double(points))
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
    func leading(_ points: Int) -> UIView {
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
    func trailing(_ points: Double) -> UIView {
        position(.trailing, points: -points)
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
    func trailing(_ points: CGFloat) -> UIView {
        trailing(Double(points))
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
    func trailing(_ points: Int) -> UIView {
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
