//
//  Stevia+Hierarchy.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    public func sv(subViews:UIView...) -> UIView {
        return sv(subViews)
    }

    public func sv(subViews:[UIView]) -> UIView {
        for sv in subViews {
            addSubview(sv)
            sv.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
}

public extension UITableViewCell {
    public override func sv(subViews:[UIView]) -> UIView {
        return contentView.sv(subViews)
    }
}

public extension UICollectionViewCell {
    public override func sv(subViews:[UIView]) -> UIView {
        return contentView.sv(subViews)
    }
}