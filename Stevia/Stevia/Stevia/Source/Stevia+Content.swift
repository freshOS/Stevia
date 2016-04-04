//
//  Stevia+Content.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func text(t:String) -> Self {
        setTitle(t, forState: .Normal)
        return self
    }
    
    public func textKey(t:String) -> Self {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
    
    public func image(s:String) -> Self {
        setImage(UIImage(named:s), forState: .Normal)
        return self
    }
}

public extension UITextField {
    public func placeholder(t:String) -> Self {
        placeholder = t
        return self
    }
}

public extension UILabel {
    public func text(t:String) -> Self {
        text = t
        return self
    }
    
    public func textKey(t:String) -> Self {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
}

extension UIImageView {
    public func image(t:String) -> Self {
        image = UIImage(named: t)
        return self
    }
}
