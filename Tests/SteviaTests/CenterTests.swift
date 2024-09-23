//
//  CenterTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import Numerics
import UIKit
import Stevia


@Suite
@MainActor struct CenterTests {
    
    let win = UIWindow(frame: UIScreen.main.bounds)
    var ctrler = UIViewController()
    var v = UIView()
    
    init() {
        win.rootViewController = ctrler
        ctrler.view.subviews { v }
        v.size(100)
        ctrler.view.layoutIfNeeded()
    }
    
    @Test
    func centerHorizontally() {
        v.centerHorizontally()
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width/2.0 - (v.frame.width/2.0)))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func centerHorizontallyWithOffsetDouble() {
        v.centerHorizontally(offset: Double(50))
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        let val = v.frame.origin.x - 50
        #expect(isApproximatelyEqual(val, ctrler.view.frame.width/2.0 - (v.frame.width/2.0)))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func centerHorizontallyWithOffsetCGFloat() {
        v.centerHorizontally(offset: CGFloat(50))
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        let val = v.frame.origin.x - 50
        #expect(isApproximatelyEqual(val, (ctrler.view.frame.width/2.0 - (v.frame.width/2.0))))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func centerHorizontallyWithOffsetInt() {
        v.centerHorizontally(offset: Int(50))
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        let val = v.frame.origin.x - 50
        #expect(isApproximatelyEqual(val, (ctrler.view.frame.width/2.0 - (v.frame.width/2.0))))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }

    @Test
    func centerVertically() {
        v.centerVertically()
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == ctrler.view.frame.height/2.0 - (v.frame.height/2.0))
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func centerVerticallyWithOffsetDouble() {
        v.centerVertically(offset: Double(50))
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        let val = v.frame.origin.y - 50
        #expect(isApproximatelyEqual(val, (ctrler.view.frame.height/2.0 - (v.frame.height/2.0))))
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func centerVerticallyWithOffsetCGFloat() {
        v.centerVertically(offset: CGFloat(50))
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        let val = v.frame.origin.y - 50
        #expect(isApproximatelyEqual(val, (ctrler.view.frame.height/2.0 - (v.frame.height/2.0))))
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func centerVerticallyWithOffsetInt() {
        v.centerVertically(offset: Int(50))
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()

        let val = v.frame.origin.y - 50
        #expect(isApproximatelyEqual(val, (ctrler.view.frame.height/2.0 - (v.frame.height/2.0))))
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func centerInContainer() {
        v.centerInContainer()
        ctrler.view.setNeedsLayout()
        ctrler.view.layoutIfNeeded()
        
        #expect(v.frame.origin.y == ctrler.view.frame.height/2.0 - (v.frame.height/2.0))
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width/2.0 - (v.frame.width/2.0)))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
        #expect(isApproximatelyEqual(v.frame.origin.y, ctrler.view.frame.height/2.0 - (v.frame.height/2.0)))
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width/2.0 - (v.frame.width/2.0)))
        #expect(v.frame.height == 100)
    }
}

func isApproximatelyEqual(_ a: Double, _ b: Double) -> Bool {
    return a.isApproximatelyEqual(to: b, absoluteTolerance: 0.5)
}
