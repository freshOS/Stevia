//
//  FlexibleMarginTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class FlexibleMarginTests: XCTestCase {
        
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
    
    /// Todo stress test by pushing views
    
    func testGreaterTop() {
        v.top(>=23)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 23, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testGreaterBottom() {
        v.bottom(>=45)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - 45, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testGreaterLeft() {
        v.left(>=23)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 23, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }

    func testGreaterRight() {
        v.right(>=74)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testLessTop() {
        v.top(<=23)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 23, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testLessBottom() {
        v.bottom(<=45)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - 45, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testLessLeft() {
        v.left(<=23)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 23, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testLessRight() {
        v.right(<=74)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    
    
    func testMarginGreaterBetweenTwoViews() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.sv([v1,v2])
        for view in ctrler.view.subviews {
            XCTAssertEqualWithAccuracy(view.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        }
        
        |v1.width(10)-(>=25)-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 10, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, 35, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testMarginLesserBetweenTwoViews() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.sv([v1,v2])
        for view in ctrler.view.subviews {
            XCTAssertEqualWithAccuracy(view.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        }
        
        |v1.width(10)-(<=25)-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 10, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, 35, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
}




