//
//  Stevia+DoubleDash.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 03/05/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

infix operator -- :AdditionPrecedence


@discardableResult
public func -- (left: UIView, right: Double) -> PartialConstraint {
    return left-right
}

public func -- (left: UIView, right: CGFloat) -> PartialConstraint {
    return left--Double(right)
}

public func -- (left: UIView, right: Int) -> PartialConstraint {
    return left--Double(right)
}

@discardableResult
public func -- (left: SideConstraint, right: UIView) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: SideConstraint) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: SideConstraint) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: PartialConstraint, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: Double) -> PartialConstraint {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: CGFloat) -> PartialConstraint {
    return left--Double(right)
}

@discardableResult
public func -- (left: [UIView], right: Int) -> PartialConstraint {
    return left--Double(right)
}

@discardableResult
public func -- (left: [UIView], right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: String) -> Space {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: String) -> Space {
    return left-right
}

@discardableResult
public func -- (left: Space, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView,
                right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

@discardableResult
public func -- (left: [UIView],
                right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

@discardableResult
public func -- (left: PartialFlexibleConstraint, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: SteviaLeftFlexibleMargin, right: UIView) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: SteviaRightFlexibleMargin) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: SteviaRightFlexibleMargin) -> [UIView] {
    return left-right
}
#endif

/// Hyphen Bullet operator is introduced to remove the ambiguity with the language "-" (minus) sign operator.
/// this ambiguity can make tu build times exponentially longer in big layout blocks.


#if canImport(UIKit)
import UIKit

infix operator ⁃ :AdditionPrecedence

@discardableResult
public func ⁃ (left: UIView, right: Double) -> PartialConstraint {
    return left-right
}

public func ⁃ (left: UIView, right: CGFloat) -> PartialConstraint {
    return left⁃Double(right)
}

public func ⁃ (left: UIView, right: Int) -> PartialConstraint {
    return left⁃Double(right)
}

@discardableResult
public func ⁃ (left: SideConstraint, right: UIView) -> UIView {
    return left-right
}

@discardableResult
public func ⁃ (left: [UIView], right: SideConstraint) -> [UIView] {
    return left-right
}

@discardableResult
public func ⁃ (left: UIView, right: SideConstraint) -> UIView {
    return left-right
}

@discardableResult
public func ⁃ (left: PartialConstraint, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func ⁃ (left: UIView, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func ⁃ (left: [UIView], right: Double) -> PartialConstraint {
    return left-right
}

@discardableResult
public func ⁃ (left: [UIView], right: CGFloat) -> PartialConstraint {
    return left⁃Double(right)
}

@discardableResult
public func ⁃ (left: [UIView], right: Int) -> PartialConstraint {
    return left⁃Double(right)
}

@discardableResult
public func ⁃ (left: [UIView], right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func ⁃ (left: UIView, right: String) -> Space {
    return left-right
}

@discardableResult
public func ⁃ (left: [UIView], right: String) -> Space {
    return left-right
}

@discardableResult
public func ⁃ (left: Space, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func ⁃ (left: UIView,
                right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

@discardableResult
public func ⁃ (left: [UIView],
                right: SteviaFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

@discardableResult
public func ⁃ (left: PartialFlexibleConstraint, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func ⁃ (left: SteviaLeftFlexibleMargin, right: UIView) -> UIView {
    return left-right
}

@discardableResult
public func ⁃ (left: UIView, right: SteviaRightFlexibleMargin) -> UIView {
    return left-right
}

@discardableResult
public func ⁃ (left: [UIView], right: SteviaRightFlexibleMargin) -> [UIView] {
    return left-right
}
#endif
