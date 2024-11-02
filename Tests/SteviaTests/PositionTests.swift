//
//  CenterTests.swift
//  Stevia
//
//  Created by Naabed on 13/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor class PositionTests {
    
    let win = UIWindow(frame: UIScreen.main.bounds)
    let ctrler =  UIViewController()
    let v = UIView()
    
    init() {
        win.rootViewController = ctrler
        ctrler.view.subviews { v }
        v.size(100.0)
    }

    @Test
    func testTopDouble() {
        v.top(Double(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testTopCGFloat() {
        v.top(CGFloat(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testTopInt() {
        v.top(Int(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testBottomDouble() {
        v.bottom(Double(45))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == ctrler.view.frame.height - v.frame.height - 45)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testBottomCGFloat() {
        v.bottom(CGFloat(45))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == ctrler.view.frame.height - v.frame.height - 45)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testBottomInt() {
        v.bottom(Int(45))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == ctrler.view.frame.height - v.frame.height - 45)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLeftDouble() {
        v.left(Double(12))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 12)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLeftCGFloat() {
        v.left(CGFloat(12))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 12)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLeftInt() {
        v.left(Int(12))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 12)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLeadingDouble() {
        v.leading(Double(12))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 12)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLeadingCGFloat() {
        v.leading(CGFloat(12))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 12)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLeadingInt() {
        v.leading(Int(12))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 12)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testRightDouble() {
        v.right(Double(74))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testRightCGFloat() {
        v.right(CGFloat(74))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testRightInt() {
        v.right(Int(74))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testTrailingDouble() {
        v.trailing(Double(74))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testTrailingCGFloat() {
        v.trailing(CGFloat(74))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testTrailingInt() {
        v.trailing(Int(74))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentTop() {
        v.top(10%)
        ctrler.view.layoutIfNeeded()
        #expect(isApproximatelyEqual(v.frame.origin.y, ctrler.view.frame.height * 0.1))
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentBottom() {
        v.bottom(10%)
        ctrler.view.layoutIfNeeded()
        #expect(isApproximatelyEqual(v.frame.origin.y, ctrler.view.frame.height * 0.9 - v.frame.height))
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentLeft() {
        v.left(10%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width * 0.1))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentRight() {
        v.right(10%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width * 0.9 - v.frame.width))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentLeading() {
        v.leading(10%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width * 0.1))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentTrailing() {
        v.trailing(10%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width * 0.9 - v.frame.width))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentLeadingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.leading(10%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(isApproximatelyEqual(v.frame.origin.x, (ctrler.view.frame.width * 0.9 - v.frame.width)))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testPercentTrailingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.trailing(10%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(isApproximatelyEqual(v.frame.origin.x, ctrler.view.frame.width * 0.1))
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
}
