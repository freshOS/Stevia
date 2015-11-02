//
//  Stevia+Tap.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

typealias ActionBlock = (() -> Void)?

class ClosureWrapper {
    var closure:ActionBlock
    
    init(_ closure:ActionBlock) {
        self.closure = closure
    }
}

private var kButtonBlockAssociationKey: UInt8 = 0
public extension UIButton {
    
    internal var testButtonBlock:ActionBlock {
        get {
            if let cw = objc_getAssociatedObject(self, &kButtonBlockAssociationKey) as? ClosureWrapper {
                return cw.closure
            }
            return nil
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kButtonBlockAssociationKey, ClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func tap(block:() -> Void) -> UIButton {
        addTarget(self, action: "tapped", forControlEvents: .TouchUpInside)
        testButtonBlock = block
        return self
    }
    
    func tapped() {
        testButtonBlock?()
    }
}