//
//  Stevia+Content.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func text(t:String) -> UIButton {
        setTitle(t, forState: .Normal)
        return self
    }
    
    public func textKey(t:String) -> UIButton {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
    
    public func image(s:String) -> UIButton {
        setImage(UIImage(named:s), forState: .Normal)
        return self
    }
}

public extension UITextField {
    public func placeholder(t:String) -> UITextField {
        placeholder = t
        return self
    }
}

public extension UILabel {
    public func text(t:String) -> UILabel {
        text = t
        return self
    }
    
    public func textKey(t:String) -> UILabel {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
}

extension UIImageView {
    public func image(t:String) -> UIImageView {
        image = UIImage(named: t)
        return self
    }
}
