//
//  Stevia+Center.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Centers the view in its container.
     
     ```
     button.centerInContainer()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func centerInContainer() -> UIView {
        if let spv = superview {
            alignCenter(self, with: spv)
        }
        return self
    }
    
    /**
     Centers the view horizontally (X axis) in its container.
     
     ```
     button.centerHorizontally()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func centerHorizontally() -> UIView {
        if let spv = superview {
            alignVertically([self, spv])
        }
        return self
    }
    
    /**
     Centers the view vertically (Y axis) in its container.
     
     ```
     button.centerVertically()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func centerVertically() -> UIView {
        if let spv = superview {
            alignHorizontally([self, spv])
        }
        return self
    }
}
