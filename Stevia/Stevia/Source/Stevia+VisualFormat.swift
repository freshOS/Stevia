//
//  Stevia+VisualFormat.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

private var kViewDictionaryAssociationKey: UInt8 = 0

extension UIView {
    
    var views:[String: AnyObject]! {
        get {
            let dic = objc_getAssociatedObject(self, &kViewDictionaryAssociationKey) as? [String: AnyObject]
            return dic ?? [String: AnyObject]()
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kViewDictionaryAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            for (key, view) in views {
                if key != "view" {
                    (view as! UIView).translatesAutoresizingMaskIntoConstraints = false
                }
            }
        }
    }
    
    func h(string:String) {
        h("\(string)", withOption: NSLayoutFormatOptions(rawValue: 0))
    }
    
    func h(string:String, withOption:NSLayoutFormatOptions) {
        kaddVisualConstraint("H:\(string)", withOption: withOption)
    }
    
    func v(string:String) {
        v("\(string)", withOption: NSLayoutFormatOptions(rawValue: 0))
    }
    
    func v(string:String, withOption:NSLayoutFormatOptions) {
        kaddVisualConstraint("V:\(string)", withOption: withOption)
    }
    
    func kaddVisualConstraint(string:String, withOption:NSLayoutFormatOptions) {
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(string, options: withOption, metrics: nil, views: views))
    }
}