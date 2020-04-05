//
//  Stevia+Center.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    
    /**
     Centers the view in its container.
     
     ```
     button.centerInContainer()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    func centerInContainer() -> Self {
        if let spv = superview {
            alignCenter(self, with: spv)
        }
        return self
    }
        
    /**
     Centers the view horizontally (X axis) in its container.
     
     ```
     button.centerHorizontally()
     button.centerHorizontally(offset: 40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    func centerHorizontally(offset: Double = 0) -> Self {
        if let spv = superview {
            align(.vertical, v1: self, with: spv, offset: offset)
        }
        return self
    }
    
    /**
     Centers the view horizontally (X axis) in its container.
     
     ```
     button.centerHorizontally()
     button.centerHorizontally(offset: 40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    func centerHorizontally(offset: CGFloat) -> Self {
        centerHorizontally(offset: Double(offset))
    }
    
    /**
     Centers the view horizontally (X axis) in its container.
     
     ```
     button.centerHorizontally()
     button.centerHorizontally(offset: 40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    func centerHorizontally(offset: Int) -> Self {
        centerHorizontally(offset: Double(offset))
    }
        
    /**
     Centers the view vertically (Y axis) in its container.
     
     ```
     button.centerVertically()
     button.centerVertically(offset: 40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    func centerVertically(offset: Double = 0) -> Self {
        if let spv = superview {
            align(.horizontal, v1: self, with: spv, offset: offset)
        }
        return self
    }
    
    /**
     Centers the view vertically (Y axis) in its container.
     
     ```
     button.centerVertically()
     button.centerVertically(offset: 40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    func centerVertically(offset: CGFloat) -> Self {
        centerVertically(offset: Double(offset))
    }
    
    /**
     Centers the view vertically (Y axis) in its container.
     
     ```
     button.centerVertically()
     button.centerVertically(offset: 40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    func centerVertically(offset: Int) -> Self {
        centerVertically(offset: Double(offset))
    }
}
#endif
