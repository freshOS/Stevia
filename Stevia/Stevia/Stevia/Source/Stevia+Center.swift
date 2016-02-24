//
//  Stevia+Center.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func centerInContainer() -> UIView  {
        if let spv = superview {
            alignCenter(self, with: spv)
        }
        return self
    }
    
    public func centerHorizontally() -> UIView {
        if let spv = superview {
            alignVertically([self,spv])
        }
        return self
    }
    
    public func centerVertically() -> UIView {
        if let spv = superview {
            alignHorizontally([self,spv])
        }
        return self
    }
}