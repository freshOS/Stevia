//
//  Stevia+Alignment.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

/** Aligns an array of views Horizontally (on the X Axis)
 
 Example Usage:
 ```
 alignHorizontally(label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 alignHorizontally(|-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
public func alignHorizontally(views: UIView...) -> [UIView] {
    return alignHorizontally(views)
}

/** Aligns an array of views Horizontally (on the X Axis)
 
 Example Usage:
 ```
 alignHorizontally(label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 alignHorizontally(|-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
public func alignHorizontally(views: [UIView]) -> [UIView] {
    align(.Horizontal, views: views)
    return views
}

/** Aligns an array of views Vertically (on the Y Axis)
 
 Example Usage:
 ```
 alignVertically(label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
public func alignVertically(views: UIView...) {
    alignVertically(views)
}

/** Aligns an array of views Vertically (on the Y Axis)
 
 Example Usage:
 ```
 alignVertically(label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
public func alignVertically(views: [UIView]) {
    align(.Vertical, views: views)
}

/** Aligns the center of two views
 
 Example Usage:
 ```
 alignCenter(button, with:image)
 ```
 */
public func alignCenter(v1: UIView, with v2: UIView) {
    alignHorizontally(v1, with: v2)
    alignVertically(v1, with: v2)
}

/** Aligns two views Horizontall (on the X Axis)
 
 Example Usage:
 ```
 alignHorizontally(label, with:field)
 ```
 
 */
public func alignHorizontally(v1: UIView, with v2: UIView, offset: CGFloat = 0) {
    align(.Horizontal, v1: v1, with: v2, offset: offset)
}

/** Aligns two views Vertically (on the Y Axis)
 
 Example Usage:
 ```
 alignVertically(label, with:field)
 ```
 
 */
public func alignVertically(v1: UIView, with v2: UIView, offset: CGFloat = 0) {
    align(.Vertical, v1: v1, with: v2, offset: offset)
}

private func align(axis: UILayoutConstraintAxis, views: [UIView]) {
    for (i, v) in views.enumerate() {
        if views.count > i+1 {
            let v2 = views[i+1]
            if axis == .Horizontal {
                alignHorizontally(v, with: v2)
            } else {
                alignVertically(v, with: v2)
            }
        }
    }
}

private func align(axis: UILayoutConstraintAxis, v1: UIView, with v2: UIView, offset: CGFloat) {
    if let spv = v1.superview {
        let center: NSLayoutAttribute = axis == .Horizontal ? .CenterY : .CenterX
        let c = constraint(item: v1, attribute: center, toItem: v2, constant:offset)
        spv.addConstraint(c)
    }
}
