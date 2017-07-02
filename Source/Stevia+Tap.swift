//
//  Stevia+Tap.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

extension UIButton: AssociatedBlock {}
public extension UIButton {

    /** Links UIButton tap (TouchUpInside) event to a block.
     
    Example Usage:
     
    ```
    button.tap {
        // do something
    }
    ```
     
    Or
    ```
    button.tap(doSomething)

    // later
    func doSomething() {
        // ...
    }
    ```
     
     - Returns: Itself for chaining purposes
     
     */
    @discardableResult
    public func tap(_ block:@escaping () -> Void) -> UIButton {
        #if swift(>=2.2)
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
        #else
        addTarget(self, action: "tapped", forControlEvents: .TouchUpInside)
        #endif
        associatedBlock = block
        return self
    }
    
    /** */
    @objc
    func tapped() {
        associatedBlock?()
    }
}
