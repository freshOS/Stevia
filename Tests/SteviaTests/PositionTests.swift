//
//  CenterTests.swift
//  Stevia
//
//  Created by Naabed on 13/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class PositionTests: XCTestCase {
    
    var win: UIWindow!
    var ctrler: UIViewController!
    var v: UIView!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.main.bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        v = UIView()
        ctrler.view.subviews {v }
        v.size(100.0)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTopDouble() {
        v.top(Double(23))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 23, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testTopCGFloat() {
        v.top(CGFloat(23))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 23, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testTopInt() {
        v.top(Int(23))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 23, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testBottomDouble() {
        v.bottom(Double(45))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - 45,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testBottomCGFloat() {
        v.bottom(CGFloat(45))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - 45,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testBottomInt() {
        v.bottom(Int(45))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - 45,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeftDouble() {
        v.left(Double(12))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeftCGFloat() {
        v.left(CGFloat(12))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeftInt() {
        v.left(Int(12))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeadingDouble() {
        v.leading(Double(12))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeadingCGFloat() {
        v.leading(CGFloat(12))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeadingInt() {
        v.leading(Int(12))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRightDouble() {
        v.right(Double(74))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRightCGFloat() {
        v.right(CGFloat(74))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRightInt() {
        v.right(Int(74))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testTrailingDouble() {
        v.trailing(Double(74))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testTrailingCGFloat() {
        v.trailing(CGFloat(74))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testTrailingInt() {
        v.trailing(Int(74))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentTop() {
        v.top(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height * (10/100) , accuracy: CGFloat(0.3))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentBottom() {
        v.bottom(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height * (90/100) - v.frame.height, accuracy: CGFloat(0.3))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentLeft() {
        v.left(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0 , accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (10/100), accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentRight() {
        v.right(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0 , accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (90/100) - v.frame.width, accuracy: CGFloat(0.2))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentLeading() {
        v.leading(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0 , accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (10/100), accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentTrailing() {
        v.trailing(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0 , accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (90/100) - v.frame.width, accuracy: CGFloat(0.2))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentLeadingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.leading(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0 , accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (90/100) - v.frame.width, accuracy: CGFloat(0.2))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentTrailingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.trailing(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0 , accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (10/100), accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
}
