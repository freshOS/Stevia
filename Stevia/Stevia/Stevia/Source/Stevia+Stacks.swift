//
//  Stevia+Stacks.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

public extension UIView {
    
    public func layout(objects:[AnyObject]) -> [UIView] {
        return stackV(objects)
    }
    
    private func stackV(objects:[AnyObject]) -> [UIView] {
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
                    tryStackViewVerticallyWithPreviousView(v, index: i, objects: objects)
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
    
    private func stackH(objects:[AnyObject]) -> [UIView] {
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
                    tryStackViewHorizontallyWithPreviousView(v, index: i, objects: objects)
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
    
    private func tryStackViewHorizontallyWithPreviousView(view:UIView, index:Int,objects:[AnyObject]) {
        if let pv = previousViewFromIndex(index, objects: objects) {
            pv.stackH(v: view)
        }
    }
    
    private func tryStackViewVerticallyWithPreviousView(view:UIView, index:Int,objects:[AnyObject]) {
        if let pv = previousViewFromIndex(index, objects: objects) {
            pv.stackV(v: view)
        }
    }
    
    private func previousViewFromIndex(index:Int,objects:[AnyObject]) -> UIView? {
        if index != 0 {
            if let previousView = objects[index-1] as? UIView {
                return previousView
            }
        }
        return nil
    }
    
    private func stackV(m points:CGFloat = 0, v:UIView) -> UIView {
        return stack(.Vertical, points: points, v: v)
    }
    
    
    private func stackH(m points:CGFloat = 0, v:UIView) -> UIView {
        return stack(.Horizontal, points: points, v: v)
    }
    
    private func stack(axis:UILayoutConstraintAxis, points:CGFloat = 0, v:UIView) -> UIView {
        let a:NSLayoutAttribute = axis == .Vertical ? .Top : .Left
        let b:NSLayoutAttribute = axis == .Vertical ? .Bottom : .Right
        if let spv = superview {
            let c = constraint(item: v, attribute: a, toItem: self, attribute: b, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
    
}