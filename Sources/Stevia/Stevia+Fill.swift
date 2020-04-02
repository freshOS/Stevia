//
//  Stevia+Fill.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    
    @discardableResult
    func fillContainer() -> Self {
        fillHorizontally()
        fillVertically()
        return self
    }
    
    @available(*, deprecated, renamed: "fillContainer(padding:)")
    @discardableResult
    func fillContainer(_ padding: Double) -> Self {
        fillContainer(padding: padding)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview`.
     A padding can be used to apply equal spaces between the view and its superview
    */
    @discardableResult
    func fillContainer(padding: Double) -> Self {
        fillHorizontally(padding: padding)
        fillVertically(padding: padding)
        return self
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview`.
     A padding can be used to apply equal spaces between the view and its superview
    */
    @discardableResult
    func fillContainer(padding: Int) -> Self {
        fillContainer(padding: Double(padding))
    }

    
    @available(*, deprecated, renamed: "fillVertically(padding:)")
    @discardableResult
    func fillVertically(m points: Double) -> Self {
        fill(.vertical, points: points)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Vertically.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    func fillVertically(padding: Double = 0) -> Self {
        fill(.vertical, points: padding)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Vertically.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    func fillVertically(padding: Int) -> Self {
        fillVertically(padding: Double(padding))
    }
    

    @available(*, deprecated, renamed: "fillHorizontally(padding:)")
    @discardableResult
    func fillHorizontally(m points: Double) -> Self {
        fill(.horizontal, points: points)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Horizontally.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    func fillHorizontally(padding: Double = 0) -> Self {
        fill(.horizontal, points: padding)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Horizontally.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    func fillHorizontally(padding: Int) -> Self {
        fillHorizontally(padding: Double(padding))
    }
    
    fileprivate func fill(_ axis: NSLayoutConstraint.Axis, points: Double = 0) -> Self {
        let a: NSLayoutConstraint.Attribute = axis == .vertical ? .top : .leading
        let b: NSLayoutConstraint.Attribute = axis == .vertical ? .bottom : .trailing
        if let spv = superview {
            let c1 = constraint(item: self, attribute: a, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: b, toItem: spv, constant: -points)
            spv.addConstraints([c1, c2])
        }
        return self
    }
}
#endif
