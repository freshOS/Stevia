//
//  CenterTests.swift
//  Stevia
//
//  Created by Naabed on 13/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest

class PositionTests: XCTestCase {
    
    var win:UIWindow!
    var ctrler:UIViewController!
    var v:UIView!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.mainScreen().bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        v = UIView()
        ctrler.view.sv([v])
        v.size(100.0)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTop() {
        v.top(23)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 23, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testBottom() {
        v.bottom(45)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - 45, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    
    func testLeft() {
        v.left(12)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 12, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testRight() {
        v.right(74)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
}
