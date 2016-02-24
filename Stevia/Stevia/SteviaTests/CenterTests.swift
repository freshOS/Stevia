//
//  CenterTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest

class CenterTests: XCTestCase {
    
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
        verifyViewHasDefaultValues()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCenterHorizontally() {
        v.size(100)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
        v.centerHorizontally()
        v.setNeedsLayout()
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, ctrler.view.frame.width/2.0 - (v.frame.width/2.0), accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testCenterVertically() {
        v.size(100)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
        v.centerVertically()
        v.setNeedsLayout()
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, ctrler.view.frame.height/2.0 - (v.frame.height/2.0), accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testCenterInContainer() {
        v.size(100)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
        v.centerInContainer()
        v.setNeedsLayout()
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, ctrler.view.frame.height/2.0 - (v.frame.height/2.0), accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, ctrler.view.frame.width/2.0 - (v.frame.width/2.0), accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }

    func verifyViewHasDefaultValues() {
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
    }
}
