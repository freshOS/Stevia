//
//  Stevia+Constraints.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class SteviaLayoutConstraint: NSLayoutConstraint {
    public static var defaultPriority: Float = UILayoutPriority.defaultHigh.rawValue + 1
}


// MARK: - Shortcut

public extension UIView {
    
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
    @discardableResult
    func addConstraint(item view1: AnyObject,
                              attribute attr1: NSLayoutConstraint.Attribute,
                              relatedBy: NSLayoutConstraint.Relation = .equal,
                              toItem view2: AnyObject? = nil,
                              attribute attr2: NSLayoutConstraint.Attribute? = nil,
                              multiplier: Double = 1,
                              constant: Double = 0) -> NSLayoutConstraint {
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
@MainActor func constraint(item view1: AnyObject,
                       attribute attr1: NSLayoutConstraint.Attribute,
                       relatedBy: NSLayoutConstraint.Relation = .equal,
                       toItem view2: AnyObject? = nil,
                       attribute attr2: NSLayoutConstraint.Attribute? = nil, // Not an attribute??
                       multiplier: Double = 1,
                       constant: Double = 0) -> NSLayoutConstraint {
        let c =  SteviaLayoutConstraint(item: view1, attribute: attr1,
                                  relatedBy: relatedBy,
                                  toItem: view2, attribute: ((attr2 == nil) ? attr1 : attr2! ),
                                  multiplier: CGFloat(multiplier), constant: CGFloat(constant))
    c.priority = UILayoutPriority(rawValue: SteviaLayoutConstraint.defaultPriority)
    return c
}

public extension UIView {

/**
     Get User added constraints. For making complex changes on layout, we need to remove user added constraints.
     
     If we remove all constraints, it may return broken layout.
     
     Use this method as:
     
        removeConstraints(userAddedConstraints)
     
*/
    var userAddedConstraints: [NSLayoutConstraint] {
        return constraints.filter { c in
            c is SteviaLayoutConstraint
        }
    }
    
    @MainActor
    @discardableResult
    func removeUserAddedConstraints() -> Self {
        removeConstraints(userAddedConstraints.filter {
            $0.firstItem === self
        })
        if let superview {
            superview.removeConstraints(superview.userAddedConstraints.filter {
                $0.firstItem === self
            })
        }
        return self
    }
}

// MARK: - Other

public extension UIView {

    /**
     Makes a view follow another view's frame.
     For instance if we want a button to be on top of an image :
     You can also set how much you want to cover the image, like set the leading, trailing, top and bottom alignment.
     
     ```
     button.followEdges(image)
     ```
     */
    func followEdges(_ otherView: UIView, top : Double = 0.0, bottom : Double = 0.0, leading : Double = 0.0, trailing : Double = 0.0) {
        if let spv = superview {
            let cs = [
                constraint(item: self, attribute: .top, toItem: otherView, constant: top),
                constraint(item: self, attribute: .trailing, toItem: otherView, constant: trailing),
                constraint(item: self, attribute: .bottom, toItem: otherView, constant: bottom),
                constraint(item: self, attribute: .leading, toItem: otherView, constant: leading)
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
    @discardableResult
    func heightEqualsWidth() -> Self {
        if let spv = superview {
            let c = constraint(item: self, attribute: .height, toItem: self, attribute: .width)
            spv.addConstraint(c)
        }
        return self
    }
    
}
#endif
