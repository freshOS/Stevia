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
    
    override func setUp() {
        win = UIWindow(frame: UIScreen.mainScreen().bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTop() {
        let padding:CGFloat = 10.0
        let v = UIView()
        ctrler.view.sv([v])
        v.size(100.0)
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in

        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
        
        v.top(padding)
        v.setNeedsLayout()
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, padding, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    
    func testBottom() {
        let padding:CGFloat = 10.0
        let v = UIView()
        ctrler.view.sv([v])
        v.size(100.0)
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
        
        v.bottom(padding)
        v.setNeedsLayout()
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - padding, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    
    func testLeft() {
        let padding:CGFloat = 10.0
        let v = UIView()
        ctrler.view.sv([v])
        v.size(100.0)
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
        
        v.left(padding)
        v.setNeedsLayout()
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, padding, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
    
    
    func testRight() {
        let padding:CGFloat = 10.0
        let v = UIView()
        ctrler.view.sv([v])
        v.size(100.0)
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
        
        v.right (padding)
        v.setNeedsLayout()
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - padding, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 100, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 100, accuracy: CGFloat(FLT_EPSILON))
    }
}
