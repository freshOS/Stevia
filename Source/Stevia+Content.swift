//
//  Stevia+Content.swift
//  LoginStevia
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
    
    func textKey(t:String) -> UIButton {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
    
    func image(s:String) -> UIButton {
        setImage(UIImage(named:s), forState: .Normal)
        return self
    }
}

extension UITextField {
    func placeholder(t:String) -> UITextField {
        placeholder = t
        return self
    }
}

extension UILabel {
    func text(t:String) -> UILabel {
        text = t
        return self
    }
    
    func textKey(t:String) -> UILabel {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
}

extension UIImageView {
    func image(t:String) -> UIImageView {
        image = UIImage(named: t)
        return self
    }
}
