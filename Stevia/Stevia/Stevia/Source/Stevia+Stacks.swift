//
//  Stevia+Stacks.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 10/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {

    /**
    
     Lays out the views on both axis.
     
     Note that this is not needed for Horizontal only layouts.
     
     `layout` is primarily for laying out views vertically but horizontal statements 
     are supported, making it perfect for describing a layout in one single statement.
     
     ```
     layout(
         100,
         |-email-| ~ 80,
         8,
         |-password-forgot-| ~ 80,
         >=20,
         |login| ~ 80,
         0
     )
     ```
     */
    public func layout(objects: Any...) -> [UIView] {
        return stackV(objects)
    }
    
    private func stackV(objects: [Any]) -> [UIView] {
        var previousMargin: CGFloat? = nil
        var previousFlexibleMargin: SteviaFlexibleMargin? = nil
        for (i, o) in objects.enumerate() {
            
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
                } else if let pfm = previousFlexibleMargin {
                    if i == 1 {
                        v.top(pfm) // only if first view
                    } else {
                        if let vx = objects[i-2] as? UIView {
                            addConstraint(
                                NSLayoutConstraint(
                                    item: v, attribute: .Top,
                                    relatedBy: pfm.relation,
                                    toItem: vx, attribute: .Bottom,
                                    multiplier: 1, constant: pfm.points
                                )
                            )
                        } else if let va = objects[i-2] as? [UIView] {
                            addConstraint(
                                NSLayoutConstraint(
                                    item: v, attribute: .Top,
                                    relatedBy: pfm.relation,
                                    toItem: va.first!, attribute: .Bottom,
                                    multiplier: 1, constant: pfm.points
                                )
                            )
                        }
                    }
                    previousFlexibleMargin = nil
                } else {
                    tryStackViewVerticallyWithPreviousView(v, index: i, objects: objects)
                }
            case is Int: fallthrough
            case is Double: fallthrough
            case is CGFloat:
                let m = cgFloatMarginFromObject(o)
                previousMargin = m // Store margin for next pass
                if i != 0 && i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.bottom(m)
                    } else if let va = objects[i-1] as? [UIView] {
                        va.first!.bottom(m)
                    }
                }
            case let fm as SteviaFlexibleMargin:
                previousFlexibleMargin = fm // Store margin for next pass
                if i != 0 && i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.bottom(fm)
                    } else if let va = objects[i-1] as? [UIView] {
                        va.first!.bottom(fm)
                    }
                }
            case _ as String:() //Do nothin' !
            case let a as [UIView]:
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
            } else if let pfm = previousFlexibleMargin {
                if i == 1 {
                    v.top(pfm) // only if first view
                } else {
                    if let vx = objects[i-2] as? UIView {
                        addConstraint(
                            NSLayoutConstraint(
                                item: v, attribute: .Top,
                                relatedBy: pfm.relation,
                                toItem: vx, attribute: .Bottom,
                                multiplier: 1, constant: pfm.points
                            )
                        )
                    } else if let va = objects[i-2] as? [UIView] {                        
                        addConstraint(
                            NSLayoutConstraint(
                                item: v, attribute: .Top,
                                relatedBy: pfm.relation,
                                toItem: va.first!, attribute: .Bottom,
                                multiplier: 1, constant: pfm.points
                            )
                        )
                    }
                }
                previousFlexibleMargin = nil
            } else {
                tryStackViewVerticallyWithPreviousView(v, index: i, objects: objects)
            }
            default: ()
            }
        }
        return objects.map {$0 as? UIView }.flatMap {$0}
    }
    
    private func cgFloatMarginFromObject(o: Any) -> CGFloat {
        var m: CGFloat = 0
        if let i = o as? Int {
            m = CGFloat(i)
        } else if let d = o as? Double {
            m = CGFloat(d)
        } else if let cg = o as? CGFloat {
            m = cg
        }
        return m
    }
    
    private func tryStackViewVerticallyWithPreviousView(view: UIView, index: Int, objects: [Any]) {
        if let pv = previousViewFromIndex(index, objects: objects) {
            pv.stackV(v: view)
        }
    }
    
    private func previousViewFromIndex(index: Int, objects: [Any]) -> UIView? {
        if index != 0 {
            if let previousView = objects[index-1] as? UIView {
                return previousView
            }
        }
        return nil
    }
    
    private func stackV(m points: CGFloat = 0, v: UIView) -> UIView {
        return stack(.Vertical, points: points, v: v)
    }
    
    private func stack(axis: UILayoutConstraintAxis, points: CGFloat = 0, v: UIView) -> UIView {
        let a: NSLayoutAttribute = axis == .Vertical ? .Top : .Left
        let b: NSLayoutAttribute = axis == .Vertical ? .Bottom : .Right
        if let spv = superview {
            let c = constraint(item: v, attribute: a, toItem: self, attribute: b, constant:points)
            spv.addConstraint(c)
        }
        return v
    }
}
