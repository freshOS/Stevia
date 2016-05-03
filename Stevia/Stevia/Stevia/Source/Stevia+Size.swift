//
//  Stevia+Size.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func size(points:CGFloat) -> UIView {
        width(points)
        height(points)
        return self
    }
    
    public func height(points:CGFloat) -> UIView {
        return size(.Height, points: points)
    }
    
    public func width(points:CGFloat) -> UIView {
        return size(.Width, points: points)
    }
    
    public func height(fm:SteviaFlexibleMargin) -> UIView {
        return size(.Height, relatedBy: fm.relation, points: fm.points)
    }
    
    public func width(fm:SteviaFlexibleMargin) -> UIView {
        return size(.Width, relatedBy: fm.relation, points: fm.points)
    }
    
    private func size(attribute:NSLayoutAttribute, relatedBy:NSLayoutRelation = .Equal, points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute:attribute, relatedBy:relatedBy, constant: points)
            spv.addConstraint(c)
        }
        return self
    }
}

public func equalSizes(views:UIView...) -> [UIView] {
    return equalSizes(views)
}

public func equalSizes(views:[UIView]) -> [UIView] {
    equalHeights(views)
    equalWidths(views)
    return views
}

public func equalWidths(views: UIView...) -> [UIView] {
    return equalWidths(views)
}

public func equalWidths(views:[UIView]) -> [UIView] {
    equal(.Width, views: views)
    return views
}

public func equalHeights(views: UIView...) -> [UIView] {
    return equalHeights(views)
}

public func equalHeights(views:[UIView]) -> [UIView] {
    equal(.Height, views: views)
    return views
}

private func equal(attribute:NSLayoutAttribute,views:[UIView]) {
    var previousView:UIView?
    for v in views {
        if let pv = previousView {
            if let spv = v.superview {
                spv.c(item: v, attribute: attribute, toItem: pv)
            }
        }
        previousView = v
    }
}




