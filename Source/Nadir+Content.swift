//
//  Nadir+Content.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

extension UIButton {
    func text(t:String) -> UIButton {
        setTitle(t, forState: .Normal)
        return self
    }
}

extension UITextField {
    func placeholder(t:String) -> UITextField {
        placeholder = t
        return self
    }
}

extension UIButton {
    convenience init(image:UIImage) {
        self.init()
        setImage(image, forState: .Normal)
    }
}

