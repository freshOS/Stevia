//
//  Stevia+Stacks.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public extension UIView {

    public func stackH(m points:CGFloat = 0, v:UIView) -> UIView {
        if let spv = superview {
            let c = constraint(item: v, attribute: .Left, toItem: self, attribute: .Right, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
    
    public func stackV(m points:CGFloat = 0, v:UIView) -> UIView {
        if let spv = superview {
            let c = constraint(item: v, attribute: .Top, toItem: self, attribute: .Bottom, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
    
    public func stackV(objects:[AnyObject]) -> [UIView] {
        var previousMargin:CGFloat? = nil
        for (i,o) in objects.enumerate() {
            if let v = o as? UIView {
                if let pm = previousMargin {
                    if i == 1 {
                        v.top(pm) // only if first view
                    } else {
                        let vx = objects[i-2] as! UIView
                        vx.stackV(m:pm, v:v)
                    }
                    previousMargin = nil
                } else {
                    
                    if i != 0 {
                        if let previousView = objects[i-1] as? UIView {
                            previousView.stackV(v: v) // Stacks two consecutive views
                        }
                    }
                }
            } else if let m = o as? CGFloat {
                previousMargin = m // Store margin for next pass
                
                if i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.bottom(m)
                    }
                }
            }
        }
        return objects.filter {$0 is UIView } as! [UIView]
    }
    
    public func stackH(objects:[AnyObject]) -> [UIView] {
        var previousMargin:CGFloat? = nil
        for (i,o) in objects.enumerate() {
            if let v = o as? UIView {
                if let pm = previousMargin {
                    if i == 1 {
                        v.left(pm) // only if first view
                    } else {
                        print(objects[i-2])
                        let vx = objects[i-2] as! UIView
                        vx.stackH(m:pm, v:v)
                    }
                    previousMargin = nil
                } else {
                    if i != 0 {
                        if let previousView = objects[i-1] as? UIView {
                            previousView.stackH(v: v) // Stacks two consecutive views
                        }
                    }
                }
            } else if let m = o as? CGFloat {
                previousMargin = m // Store margin for next pass
                if i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.right(m)
                    }
                }
            }
        }
        return objects.filter {$0 is UIView } as! [UIView]
    }
    
    
}