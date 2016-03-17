//
//  Stevia+Alignment.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public func alignHorizontally(views:UIView...) -> [UIView] {
    return alignHorizontally(views)
}

public func alignHorizontally(views:[UIView]) -> [UIView] {
    align(.Horizontal, views: views)
    return views
}

public func alignVertically(views:UIView...) {
    alignVertically(views)
}

public func alignVertically(views:[UIView]) {
    align(.Vertical, views: views)
}

public func alignCenter(v1:UIView, with v2:UIView) {
    alignHorizontally(v1, with: v2)
    alignVertically(v1, with: v2)
}

private func align(axis:UILayoutConstraintAxis, views:[UIView]) {
    for (i,v) in views.enumerate() {
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

private func alignHorizontally(v1:UIView, with v2:UIView) {
    align(.Horizontal, v1: v1, with: v2)
}

private func alignVertically(v1:UIView, with v2:UIView) {
    align(.Vertical, v1: v1, with: v2)
}

private func align(axis:UILayoutConstraintAxis,v1:UIView, with v2:UIView) {
    if let spv = v1.superview {
        let center:NSLayoutAttribute = axis == .Horizontal ? .CenterY : .CenterX
        let c = constraint(item: v1, attribute: center, toItem: v2)
        spv.addConstraint(c)
    }
}

