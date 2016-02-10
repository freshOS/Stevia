//
//  Stevia+Center.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func centerInContainer() {
        if let spv = superview {
            alignCenter(self, with: spv)
        }
    }
    
    public func centerHorizontallyInContainer() {
        if let spv = superview {
            alignVertically(self, with: spv)
        }
    }
    
    public func centerVerticallyInContainer() {
        if let spv = superview {
            alignHorizontally(self, with: spv)
        }
    }
}