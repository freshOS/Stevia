//
//  Stevia+Percentage.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/01/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public struct SteviaPercentage {
    let value: CGFloat
}

postfix operator %
public postfix func % (v: CGFloat) -> SteviaPercentage {
    return SteviaPercentage(value: v)
}

public extension UIView {
    
    @discardableResult
    public func size(_ p: SteviaPercentage) -> UIView {
        width(p)
        height(p)
        return self
    }
    
    @discardableResult
    public func width(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Width == p.value % spv.Width
        }
        return self
    }
    
    @discardableResult
    public func height(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Height == p.value % spv.Height
        }
        return self
    }
    
    @discardableResult
    public func top(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Top == p.value % spv.Bottom
        }
        return self
    }
    
    @discardableResult
    public func left(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Left == p.value % spv.Right
        }
        return self
    }
    
    @discardableResult
    public func right(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            if p.value == 100 {
                Right == spv.Left
            } else {
                Right == (100 - p.value) % spv.Right
            }
        }
        return self
    }
    
    @discardableResult
    public func bottom(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            if p.value == 100 {
                Bottom == spv.Top
            } else {
                Bottom == (100 - p.value) % spv.Bottom
            }
        }
        return self
    }
}
