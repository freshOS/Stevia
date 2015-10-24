//
//  Stevia+Style.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    public func style(styleClosure:(v:UIView) -> Void) -> UIView {
        styleClosure(v:self)
        return self
    }
}

public extension UILabel {
    public override func style(styleClosure:(l:UILabel) -> Void) -> UILabel {
        styleClosure(l:self)
        return self
    }
}

public extension UITextField {
    public override func style(styleClosure:(f:UITextField) -> Void) -> UITextField {
        styleClosure(f:self)
        return self
    }
}

public extension UITextView {
    public override func style(styleClosure:(f:UITextView) -> Void) -> UITextView {
        styleClosure(f:self)
        return self
    }
}

public extension UIButton {
    public override func style(styleClosure:(b:UIButton) -> Void) -> UIButton {
        styleClosure(b:self)
        return self
    }
}

public extension UIImageView {
    public override func style(styleClosure:(v:UIImageView) -> Void) -> UIImageView {
        styleClosure(v:self)
        return self
    }
}

public extension UICollectionView {
    public override func style(styleClosure:(cv:UICollectionView) -> Void) -> UICollectionView {
        styleClosure(cv:self)
        return self
    }
}

public extension UITableView {
    public override func style(styleClosure:(tbv:UITableView) -> Void) -> UITableView {
        styleClosure(tbv:self)
        return self
    }
}

public extension UISegmentedControl {
    override func style(styleClosure:(sc:UISegmentedControl) -> Void) -> UISegmentedControl {
        styleClosure(sc:self)
        return self
    }
}