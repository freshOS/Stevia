//
//  Stevia+Position.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

prefix operator >= {}
public prefix func >= (p: CGFloat) -> SteviaFlexibleMargin {
    return SteviaFlexibleMargin(points: p, relation: .GreaterThanOrEqual)
}

prefix operator <= {}
public prefix func <= (p: CGFloat) -> SteviaFlexibleMargin {
    return SteviaFlexibleMargin(points: p, relation: .LessThanOrEqual)
}

public struct SteviaFlexibleMargin {
    var points:CGFloat!
    var relation:NSLayoutRelation!
}


public struct PartialFlexibleConstraint {
    var fm:SteviaFlexibleMargin!
    var view1:UIView?
    var views:[UIView]?
}

public func - (left: UIView, right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return PartialFlexibleConstraint(fm: right, view1: left, views: nil)
}

public func - (left: [UIView], right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return PartialFlexibleConstraint(fm: right, view1: nil, views: left)
}

public func - (left: PartialFlexibleConstraint, right:UIView) -> [UIView] {
    if let views = left.views {
        if let spv = right.superview {
            let c = constraint(item: right, attribute: .Left, toItem: views.last, attribute: .Right, relatedBy:left.fm.relation, constant: left.fm.points)
            spv.addConstraint(c)
        }
        return views + [right]
    } else {
        if let spv = right.superview {
            let c = constraint(item: right, attribute: .Left, toItem: left.view1!, attribute: .Right, relatedBy:left.fm.relation, constant: left.fm.points)
            spv.addConstraint(c)
        }
        return [left.view1!, right]
    }
}

public extension UIView {
    
    public func left(points:CGFloat) -> UIView {
        return position(.Left, points: points)
    }
    
    public func right(points:CGFloat) -> UIView {
        return position(.Right, points: -points)
    }
    
    public func top(points:CGFloat) -> UIView {
        return position(.Top, points: points)
    }
    
    public func bottom(points:CGFloat) -> UIView {
        return position(.Bottom, points: -points)
    }
    
    ///
    public func left(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Left, relatedBy:fm.relation, points: fm.points)
    }
    
    public func right(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Right, relatedBy:fm.relation, points: -fm.points)
    }
    
    public func top(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Top, relatedBy:fm.relation, points: fm.points)
    }
    
    public func bottom(fm:SteviaFlexibleMargin) -> UIView {
        return position(.Bottom, relatedBy:fm.relation, points: -fm.points)
    }
    
    ///
    
    private func position(position:NSLayoutAttribute, relatedBy:NSLayoutRelation = .Equal, points:CGFloat) -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: position, toItem: spv, relatedBy:relatedBy, constant: points)
            spv.addConstraint(c)
        }
        return self
    }

}