//
//  Stevia+Stacks.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {

    public func layout(objects:AnyObject...) -> [UIView] {
        return layout(objects)
    }

    public func layout(objects:[AnyObject]) -> [UIView] {
        return stackV(objects)
    }

    private func stackV(objects:[AnyObject]) -> [UIView] {
        var previousMargin:CGFloat? = nil
        for (i,o) in objects.enumerate() {
            
            switch o {
                
            case let v as UIView:
                
                if let pm = previousMargin {
                    if i == 1 {
                        v.top(pm) // only if first view
                    } else {
                        if let vx = objects[i-2] as? UIView {
                            vx.stackV(m:pm, v:v)
                        } else if let va = objects[i-2] as? [UIView] {
                            va.first!.stackV(m:pm, v:v)
                        }
                    }
                    previousMargin = nil
                } else {
                    tryStackViewVerticallyWithPreviousView(v, index: i, objects: objects)
                }
                
                
            case let m as CGFloat:
                previousMargin = m // Store margin for next pass
                
                if i != 0 && i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.bottom(m)
                    } else if let va = objects[i-1] as? [UIView] {
                        va.first!.bottom(m)
                    }
                }
            case _ as String:() //Do nothin' !
            case let a as [UIView]:
            
            // Align them horizontally!
            
            alignHorizontally(a)
            
            
            let v = a.first!
            if let pm = previousMargin {
                if i == 1 {
                    v.top(pm) // only if first view
                } else {
                    if let vx = objects[i-2] as? UIView {
                        vx.stackV(m:pm, v:v)
                    } else if let va = objects[i-2] as? [UIView] {
                        va.first!.stackV(m:pm, v:v)
                    }
                }
                previousMargin = nil
            } else {
                tryStackViewVerticallyWithPreviousView(v, index: i, objects: objects)
            }
                
                
            default: ()
            }
    
        }
        return objects.filter {$0 is UIView } as! [UIView]
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
