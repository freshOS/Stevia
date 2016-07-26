//
//  Stevia+Style.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIAppearance {
    
    /** Applies a styling block on an element.
     
    Example Usage:
     
    ```
    button.style { b in
        b.A = X
        b.B = Y
        b.C = Z
    }
    ```
     
    Handy for reusing styles :
    ```
    button.style(buttonStyle)

    // later
    func buttonStyle(b: UIButton) {
     ..styling code
    }
    ```
     
    - Returns: Itself for chaining purposes
     
     */
    public func style(styleClosure: (Self)->()) -> Self {
        styleClosure(self)
        return self
    }
}
