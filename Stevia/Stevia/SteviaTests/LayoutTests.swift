//
//  LayoutTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class LayoutTests: XCTestCase {
    
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
    
    func testEmptyLeftMargin() {
        |v
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testDefaultMargin() {
        |-v
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 8, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testLeftMargin() {
        |-75-v
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 75, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testEmptyRightMargin() {
        v|
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testDefaultRightMargin() {
        v-|
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 8, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testRightMargin() {
        v-14-|
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 14, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }

    func testHeight() {
        v ~ 180
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 180, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testMultipleHeightsAtOnce() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.sv([v1,v2,v3])
        for view in ctrler.view.subviews {
            XCTAssertEqualWithAccuracy(view.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        }
        [v1,v2,v3] ~ 63
        ctrler.view.layoutIfNeeded()
        for view in ctrler.view.subviews {
            XCTAssertEqualWithAccuracy(view.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.height, 63, accuracy: CGFloat(FLT_EPSILON))
        }
    }
    
    
    func testDefaultMarginBetweenTwoViews() {
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
        
        |v1.width(10)-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 10, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, 18, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testMarginBetweenTwoViews() {
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
        
        |v1.width(10)-52-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 10, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, 62, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testArrayRightConstraint() {
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
        
        v1-52-v2.width(10)-31-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, ctrler.view.frame.width - 31 - v2.frame.width - 52, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, ctrler.view.frame.width - 31 -  v2.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 10, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testDefaultMarginBetweenThreeViews() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.sv([v1,v2,v3])
        for view in ctrler.view.subviews {
            XCTAssertEqualWithAccuracy(view.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        }
        
        |v1.width(20)-v2.width(20)-v3
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, 28, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.origin.x, v2.frame.origin.x + v2.frame.width + 8, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    
    func testMarginsBetweenThreeViews() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.sv([v1,v2,v3])
        for view in ctrler.view.subviews {
            XCTAssertEqualWithAccuracy(view.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        }
        
        |v1.width(20)-43-v2.width(20)-27-v3
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, v1.frame.origin.x + v1.frame.width + 43 , accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.origin.x, v2.frame.origin.x + v2.frame.width + 27, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
    }
    
    func testSpaceBetweenTwoViews() {
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
        
        |v1.width(20)-""-v2.width(20)|
        ctrler.view.layoutIfNeeded()
        
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, ctrler.view.frame.width - v2.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testSpaceWithArrayOfViews() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.sv([v1,v2,v3])
        for view in ctrler.view.subviews {
            XCTAssertEqualWithAccuracy(view.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(view.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        }
        
        |v1.width(20)-v2.width(30)-""-v3.width(10)|
        ctrler.view.layoutIfNeeded()
        
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, v1.frame.width + 8, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 30, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        XCTAssertEqualWithAccuracy(v3.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.origin.x, ctrler.view.frame.width - v3.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.width, 10, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v3.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func verifyViewHasDefaultValues() {
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
    }
}
