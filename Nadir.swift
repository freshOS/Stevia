//
//  Nadir.swift
//
//  Created by Sacha Durand Saint Omer on 13/04/15.
//  Copyright (c) 2015 Nadir. All rights reserved.
//

import UIKit

private var kViewDictionaryAssociationKey: UInt8 = 0

extension UIView {
    
    var views:[NSObject: AnyObject]! {
        get {
            var dic = objc_getAssociatedObject(self, &kViewDictionaryAssociationKey) as? [NSObject: AnyObject]
            return dic ?? [NSObject: AnyObject]()
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kViewDictionaryAssociationKey, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
            for (key, view) in views {
                if key != "view" {
                    (view as! UIView).setTranslatesAutoresizingMaskIntoConstraints(false)
                }
            }
        }
    }
    
    func c(item view1: AnyObject,
        attribute attr1: NSLayoutAttribute,
        relatedBy: NSLayoutRelation = .Equal,
        toItem view2: AnyObject? = nil,
        attribute attr2: NSLayoutAttribute? = nil,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0) {
        addConstraint(NSLayoutConstraint(item: view1, attribute: attr1, relatedBy: relatedBy, toItem: view2, attribute: ((attr2 == nil) ? attr1 : attr2! ), multiplier: multiplier, constant: constant))
    }
    
    func h(string:String) {
        kaddVisualConstraint("H:\(string)", withOption: NSLayoutFormatOptions(0))
    }
    
    func v(string:String) {
        kaddVisualConstraint("V:\(string)", withOption: NSLayoutFormatOptions(0))
    }
    
    func kaddVisualConstraint(string:String, withOption:NSLayoutFormatOptions) {
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(string, options: withOption, metrics: nil, views: views))
    }
        
    func addSV(subViews:[UIView]) -> UIView {
        for sv in subViews {
            addSubview(sv)
        }
        return self
    }
}

extension UIView {
    func style(styleClosure:(v:UIView) -> Void) {
        styleClosure(v:self)
    }
}

extension UILabel {
    override func style(styleClosure:(l:UILabel) -> Void) {
        styleClosure(l:self)
    }
}

extension UIButton {
    override func style(styleClosure:(b:UIButton) -> Void) {
        styleClosure(b:self)
    }
}

extension UIImageView {
    override func style(styleClosure:(v:UIImageView) -> Void) {
        styleClosure(v:self)
    }
}

extension UICollectionView {
    override func style(styleClosure:(cv:UICollectionView) -> Void) {
        styleClosure(cv:self)
    }
}
