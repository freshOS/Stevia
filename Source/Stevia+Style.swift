//
//  Stevia+Style.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

extension UIView {
    func style(styleClosure:(v:UIView) -> Void) -> UIView {
        styleClosure(v:self)
        return self
    }
}

extension UILabel {
    override func style(styleClosure:(l:UILabel) -> Void) -> UILabel {
        styleClosure(l:self)
        return self
    }
}

extension UITextField {
    override func style(styleClosure:(f:UITextField) -> Void) -> UITextField {
        styleClosure(f:self)
        return self
    }
}

extension UITextView {
    override func style(styleClosure:(f:UITextView) -> Void) -> UITextView {
        styleClosure(f:self)
        return self
    }
}

extension UIButton {
    override func style(styleClosure:(b:UIButton) -> Void) -> UIButton {
        styleClosure(b:self)
        return self
    }
}

extension UIImageView {
    override func style(styleClosure:(v:UIImageView) -> Void) -> UIImageView {
        styleClosure(v:self)
        return self
    }
}

extension UICollectionView {
    override func style(styleClosure:(cv:UICollectionView) -> Void) -> UICollectionView {
        styleClosure(cv:self)
        return self
    }
}

extension UITableView {
    override func style(styleClosure:(tbv:UITableView) -> Void) -> UITableView {
        styleClosure(tbv:self)
        return self
    }
}

extension UISegmentedControl {
    override func style(styleClosure:(sc:UISegmentedControl) -> Void) -> UISegmentedControl {
        styleClosure(sc:self)
        return self
    }
}