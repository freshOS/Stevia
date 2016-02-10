//
//  Stevia+Aligngment.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public func alignHorizontally(v1:UIView, with v2:UIView) {
    if let spv = v1.superview {
        let c = constraint(item: v1, attribute: .CenterY, toItem: v2)
        spv.addConstraint(c)
    }
}

public func alignHorizontally(views:[UIView]) {
    for (i,v) in views.enumerate() {
        if views.count > i+1 {
            let v2 = views[i+1]
            alignHorizontally(v, with: v2)
        }
    }
}

public func alignVertically(v1:UIView, with v2:UIView) {
    if let spv = v1.superview {
        let c = constraint(item: v1, attribute: .CenterX, toItem: v2)
        spv.addConstraint(c)
    }
}

public func alignVertically(views:[UIView]) {
    for (i,v) in views.enumerate() {
        if views.count > i+1 {
            let v2 = views[i+1]
            alignVertically(v, with: v2)
        }
    }
}

public func alignCenter(v1:UIView, with v2:UIView) {
    alignHorizontally(v1, with: v2)
    alignVertically(v1, with: v2)
}