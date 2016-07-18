//
//  Stevia+Content.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /**
     Sets the title of the button for normal State
     
     Essentially a shortcut for `setTitle("MyText", forState: .Normal)`
     
     - Returns: Itself for chaining purposes
    */
    public func text(t: String) -> Self {
        setTitle(t, forState: .Normal)
        return self
    }
    
    /**
     Sets the localized key for the button's title in normal State
     
     Essentially a shortcut for `setTitle(NSLocalizedString("MyText", comment: "")
     , forState: .Normal)`
     
     - Returns: Itself for chaining purposes
     */
    public func textKey(t: String) -> Self {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
    
    /**
     Sets the image of the button in normal State
     
     Essentially a shortcut for `setImage(UIImage(named:"X"), forState: .Normal)`
     
     - Returns: Itself for chaining purposes
     */
    public func image(s: String) -> Self {
        setImage(UIImage(named:s), forState: .Normal)
        return self
    }
}


public extension UITextField {
    /**
     Sets the textfield placeholder but in a chainable fashion
     - Returns: Itself for chaining purposes
     */
    public func placeholder(t: String) -> Self {
        placeholder = t
        return self
    }
}

public extension UILabel {
    /**
     Sets the label text but in a chainable fashion
     - Returns: Itself for chaining purposes
     */
    public func text(t: String) -> Self {
        text = t
        return self
    }
    
    /**
     Sets the label localization key but in a chainable fashion
     Essentially a shortcut for `text = NSLocalizedString("X", comment: "")`
     - Returns: Itself for chaining purposes
     */
    public func textKey(t: String) -> Self {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
}

extension UIImageView {
    /**
     Sets the image of the imageView but in a chainable fashion
     
     Essentially a shortcut for `image = UIImage(named: "X")`
     
     - Returns: Itself for chaining purposes
     */
    public func image(t: String) -> Self {
        image = UIImage(named: t)
        return self
    }
}
