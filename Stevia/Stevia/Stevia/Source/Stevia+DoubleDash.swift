//
//  Stevia+DoubleDash.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 03/05/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation


infix operator -- {associativity left}

public func -- (left: UIView, right: CGFloat) -> PartialConstraint {
    return left-right
}

public func -- (left: SideConstraint, right: UIView) -> UIView {
    return left-right
}

public func -- (left: [UIView], right: SideConstraint) -> [UIView] {
    return left-right
}

public func -- (left:UIView, right: SideConstraint) -> UIView {
    return left-right
}

public func -- (left: PartialConstraint, right: UIView) -> [UIView] {
    return left-right
}

public func -- (left: UIView, right: UIView) -> [UIView] {
    return left-right
}

public func -- (left: [UIView], right: CGFloat) -> PartialConstraint {
    return left-right
}

public func -- (left: [UIView], right: UIView) -> [UIView] {
    return left-right
}

public func -- (left: UIView, right: String) -> Space {
    return left-right
}

public func -- (left: [UIView], right: String) -> Space {
    return left-right
}

public func -- (left: Space, right: UIView) -> [UIView] {
    return left-right
}

public func -- (left: UIView, right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

public func -- (left: [UIView], right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

public func -- (left: PartialFlexibleConstraint, right:UIView) -> [UIView] {
    return left-right
}