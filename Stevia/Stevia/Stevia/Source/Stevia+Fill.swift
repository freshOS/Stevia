//
//  Stevia+Fill.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public extension UIView {
    
    public func fillContainer(padding:CGFloat = 0) {
        fillH(m: padding)
        fillV(m: padding)
    }

    public func fillH(m points:CGFloat = 0) -> UIView {
        if let spv = superview {
            let c1 = constraint(item: self, attribute: .Left, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: .Right, toItem: spv, constant: -points)
            spv.addConstraints([c1,c2])
        }
        return self
    }
    
    public func fillV(m points:CGFloat = 0) -> UIView {
        if let spv = superview {
            let c1 = constraint(item: self, attribute: .Top, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: .Bottom, toItem: spv, constant: -points)
            spv.addConstraints([c1,c2])
        }
        return self
    }
    
}

public func fillHorizontally(v:UIView) {
    if let spv = v.superview {
        let c1 = constraint(item: v, attribute: .Left, toItem: spv)
        let c2 = constraint(item: v, attribute: .Right, toItem: spv)
        spv.addConstraints([c1,c2])
    }
}