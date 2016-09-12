//
//  Stevia+GetConstraint.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 12/03/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public extension UIView {
    
    /** Gets the left constraint if found.
    
    Example Usage for changing left margin of a label :
    ```
    label.leftConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The left NSLayoutConstraint if found.
     */
    public var leftConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .Left)
    }

    /** Gets the right constraint if found.
     
    Example Usage for changing right margin of a label :
     
    ```
    label.rightConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The right NSLayoutConstraint if found.
     */
    public var rightConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .Right)
    }
    
    
    /** Gets the top constraint if found.
     
    Example Usage for changing top margin of a label :
     
    ```
    label.topConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The top NSLayoutConstraint if found.
     */
    public var topConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .Top)
    }
    
    /** Gets the bottom constraint if found.
    
    Example Usage for changing bottom margin of a label :
     
    ```
    label.bottomConstraint?.constant = 10
    
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
     - Returns: The bottom NSLayoutConstraint if found.
     */
    public var bottomConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .Bottom)
    }
    
    /** Gets the height constraint if found.
     
    Example Usage for changing height property of a label :
     
    ```
    label.heightConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The height NSLayoutConstraint if found.
    */
    public var heightConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .Height)
    }
    
    /** Gets the width constraint if found.
     
     Example Usage for changing width property of a label :
     
     ```
     label.widthConstraint?.constant = 10
     
     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The width NSLayoutConstraint if found.
     */
    public var widthConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .Width)
    }
    
}

func constraintForView(v: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
    if let spv = v.superview {
        for c in spv.constraints {
            if let fi = c.firstItem as? NSObject where fi == v && c.firstAttribute == attribute {
                return c
            }
            if let si = c.secondItem as? NSObject where si == v && c.secondAttribute == attribute {
                return c
            }
        }
    }
    return nil
}
