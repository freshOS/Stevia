//
//  Stevia+Constraints.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

// MARK: - Shortcut

public extension UIView {
    
    @available(*, deprecated=2.2.1, message="Use 'addConstraint' instead")
    /**
     Helper for creating and adding NSLayoutConstraint but with default values provided.
     
     For instance
     
         c(item: view1, attribute: .CenterX, toItem: view2)
     
     is equivalent to
     
         addConstraint(
            NSLayoutConstraint(item: view1,
                attribute: .CenterX,
                relatedBy: .Equal,
                toItem: view2,
                attribute: .CenterX,
                multiplier: 1,
                constant: 0
            )
         )
     
     - Returns: The NSLayoutConstraint created.
     */
    public func c(item view1: AnyObject,
        attribute attr1: NSLayoutAttribute,
        relatedBy: NSLayoutRelation = .Equal,
        toItem view2: AnyObject? = nil,
        attribute attr2: NSLayoutAttribute? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0) -> NSLayoutConstraint {
            let c = constraint(
                item: view1, attribute: attr1,
                relatedBy: relatedBy,
                toItem: view2, attribute: attr2,
                multiplier: multiplier, constant: constant)
            addConstraint(c)
            return c
    }
    
    /**
     Helper for creating and adding NSLayoutConstraint but with default values provided.
     
     For instance
     
        addConstraint(item: view1, attribute: .CenterX, toItem: view2)
     
     is equivalent to
     
         addConstraint(
            NSLayoutConstraint(item: view1,
                attribute: .CenterX,
                 relatedBy: .Equal,
                 toItem: view2,
                 attribute: .CenterX,
                 multiplier: 1,
                 constant: 0
            )
         )
     
     - Returns: The NSLayoutConstraint created.
     */
    public func addConstraint(item view1: AnyObject,
                       attribute attr1: NSLayoutAttribute,
                                 relatedBy: NSLayoutRelation = .Equal,
                                 toItem view2: AnyObject? = nil,
                                        attribute attr2: NSLayoutAttribute? = nil,
                                                  multiplier: CGFloat = 1,
                                                  constant: CGFloat = 0) -> NSLayoutConstraint {
        let c = constraint(
            item: view1, attribute: attr1,
            relatedBy: relatedBy,
            toItem: view2, attribute: attr2,
            multiplier: multiplier, constant: constant)
        addConstraint(c)
        return c
    }
}


/**
    Helper for creating a NSLayoutConstraint but with default values provided.
 
 For instance 
 
        constraint(item: view1, attribute: .CenterX, toItem: view2)
 
  is equivalent to
 
        NSLayoutConstraint(item: view1, attribute: .CenterX,
        relatedBy: .Equal,
        toItem: view2, attribute: .CenterX,
        multiplier: 1, constant: 0)
 
    - Returns: The NSLayoutConstraint created.
 */
public func constraint(item view1: AnyObject,
    attribute attr1: NSLayoutAttribute,
    relatedBy: NSLayoutRelation = .Equal,
    toItem view2: AnyObject? = nil,
    attribute attr2: NSLayoutAttribute? = nil, // Not an attribute??
    multiplier: CGFloat = 1,
    constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view1, attribute: attr1,
                                  relatedBy: relatedBy,
                                  toItem: view2, attribute: ((attr2 == nil) ? attr1 : attr2! ),
                                  multiplier: multiplier, constant: constant)
}

//MARK: - Other

public extension UIView {

    /**
     Makes a view follow another view's frame.
     For instance if we want a button to be on top of an image :
     
     ```
     button.followEdges(image)
     ```
     */
    public func followEdges(otherView: UIView) {
        if let spv = superview {
            let cs = [
                constraint(item: self, attribute: .Top, toItem: otherView),
                constraint(item: self, attribute: .Right, toItem: otherView),
                constraint(item: self, attribute: .Bottom, toItem: otherView),
                constraint(item: self, attribute: .Left, toItem: otherView)
            ]
            spv.addConstraints(cs)
        }
    }
    
    /**
     Enforce a view to keep height and width equal at all times, essentially
     forcing it to be a square.
     
     ```
     image.heightEqualsWidth()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func heightEqualsWidth() -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .Height, toItem: self, attribute: .Width)
            spv.addConstraint(c)
        }
        return self
    }
    
}
