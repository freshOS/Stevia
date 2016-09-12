//
//  Stevia+FlexibleMargin.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/07/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

prefix operator >= {}
public prefix func >= (p: CGFloat) -> SteviaFlexibleMargin {
    return SteviaFlexibleMargin(points: p, relation: .GreaterThanOrEqual)
}

prefix operator <= {}
public prefix func <= (p: CGFloat) -> SteviaFlexibleMargin {
    return SteviaFlexibleMargin(points: p, relation: .LessThanOrEqual)
}

public struct SteviaFlexibleMargin {
    var points: CGFloat!
    var relation: NSLayoutRelation!
}


public struct PartialFlexibleConstraint {
    var fm: SteviaFlexibleMargin!
    var view1: UIView?
    var views: [UIView]?
}

public func - (left: UIView, right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return PartialFlexibleConstraint(fm: right, view1: left, views: nil)
}

public func - (left: [UIView], right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return PartialFlexibleConstraint(fm: right, view1: nil, views: left)
}

public func - (left: PartialFlexibleConstraint, right: UIView) -> [UIView] {
    if let views = left.views {
        if let spv = right.superview {
            let c = constraint(item: right, attribute: .Left,
                               toItem: views.last, attribute: .Right,
                               relatedBy:left.fm.relation,
                               constant: left.fm.points)
            spv.addConstraint(c)
        }
        return views + [right]
    } else {
        if let spv = right.superview {
            let c = constraint(item: right, attribute: .Left,
                               toItem: left.view1!, attribute: .Right,
                               relatedBy:left.fm.relation,
                               constant: left.fm.points)
            spv.addConstraint(c)
        }
        return [left.view1!, right]
    }
}


// Left Flexible margin

public struct SteviaLeftFlexibleMargin {
    let fm: SteviaFlexibleMargin
}

public prefix func |- (fm: SteviaFlexibleMargin) -> SteviaLeftFlexibleMargin {
    return SteviaLeftFlexibleMargin(fm: fm)
}

public func - (left: SteviaLeftFlexibleMargin, right: UIView) -> UIView {
    if let spv = right.superview {
        let c = constraint(item: right, attribute: .Left,
                           toItem: spv, attribute: .Left,
                           relatedBy:left.fm.relation,
                           constant: left.fm.points)
        spv.addConstraint(c)
    }
    return right
}

// Right Flexible margin

public struct SteviaRightFlexibleMargin {
    let fm: SteviaFlexibleMargin
}

public postfix func -| (fm: SteviaFlexibleMargin) -> SteviaRightFlexibleMargin {
    return SteviaRightFlexibleMargin(fm: fm)
}

public func - (left: UIView, right: SteviaRightFlexibleMargin) -> UIView {
    if let spv = left.superview {
        let c = constraint(item: spv, attribute: .Right,
                           toItem: left, attribute: .Right,
                           relatedBy:right.fm.relation,
                           constant: right.fm.points)
        spv.addConstraint(c)
    }
    return left
}

public func - (left: [UIView], right: SteviaRightFlexibleMargin) -> [UIView] {
    if let spv = left.last!.superview {
        let c = constraint(item: spv, attribute: .Right,
                           toItem: left.last!,
                           attribute: .Right,
                           relatedBy:right.fm.relation,
                           constant: right.fm.points)
        spv.addConstraint(c)
    }
    return left
}
