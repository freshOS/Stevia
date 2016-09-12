//
//  Stevia+Size.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Adds an Autolayout constraint for sizing the view.
     
     ```
     image.size(100)
     
     // is equivalent to
     
     image.width(100).height(100)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func size(points: CGFloat) -> UIView {
        width(points)
        height(points)
        return self
    }
    

    /**
     Adds an Autolayout constraint for setting the view's height.
     
     ```
     image.height(100)
     
     // is equivalent to
     
     image ~ 100
     
     // Flexible margins
     image.height(<=100)
     image.height(>=100)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func height(points: CGFloat) -> UIView {
        return size(.Height, points: points)
    }
    
    /**
     Adds an Autolayout constraint for setting the view's width.
     
     ```
     image.width(100)
     image.width(<=100)
     image.width(>=100)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func width(points: CGFloat) -> UIView {
        return size(.Width, points: points)
    }
    
    /**
     Adds an Autolayout constraint for setting the view's height.
     
     ```
     image.height(100)
     
     // is equivalent to
     
     image ~ 100
     
     // Flexible margins
     image.height(<=100)
     image.height(>=100)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func height(fm: SteviaFlexibleMargin) -> UIView {
        return size(.Height, relatedBy: fm.relation, points: fm.points)
    }
    
    /**
     Adds an Autolayout constraint for setting the view's width.
     
     ```
     image.width(100)
     image.width(<=100)
     image.width(>=100)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    public func width(fm: SteviaFlexibleMargin) -> UIView {
        return size(.Width, relatedBy: fm.relation, points: fm.points)
    }
    
    private func size(attribute: NSLayoutAttribute,
                      relatedBy: NSLayoutRelation = .Equal,
                      points: CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute:attribute,
                               relatedBy:relatedBy,
                               constant: points)
            spv.addConstraint(c)
        }
        return self
    }
}

/**
 Enforces an array of views to keep the same size.
 
 ```
 equalSizes(image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
public func equalSizes(views: UIView...) -> [UIView] {
    return equalSizes(views)
}

/**
 Enforces an array of views to keep the same size.
 
 ```
 equalSizes(image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
public func equalSizes(views: [UIView]) -> [UIView] {
    equalHeights(views)
    equalWidths(views)
    return views
}

/**
 Enforces an array of views to keep the same widths.
 
 ```
 equalWidths(image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
public func equalWidths(views: UIView...) -> [UIView] {
    return equalWidths(views)
}

/**
 Enforces an array of views to keep the same widths.
 
 ```
 equalWidths(image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
public func equalWidths(views: [UIView]) -> [UIView] {
    equal(.Width, views: views)
    return views
}

/**
 Enforces an array of views to keep the same heights.
 
 ```
 equalHeights(image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
public func equalHeights(views: UIView...) -> [UIView] {
    return equalHeights(views)
}

/**
 Enforces an array of views to keep the same heights.
 
 ```
 equalHeights(image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
public func equalHeights(views: [UIView]) -> [UIView] {
    equal(.Height, views: views)
    return views
}

private func equal(attribute: NSLayoutAttribute, views: [UIView]) {
    var previousView: UIView?
    for v in views {
        if let pv = previousView {
            if let spv = v.superview {
                spv.addConstraint(item: v, attribute: attribute, toItem: pv)
            }
        }
        previousView = v
    }
}
