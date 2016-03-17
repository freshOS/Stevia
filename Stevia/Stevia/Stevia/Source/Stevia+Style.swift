//
//  Stevia+Style.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIAppearance {
    public func style(styleClosure : (Self)->()) -> Self {
        styleClosure(self)
        return self
    }
}
