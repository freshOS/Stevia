//
//  SizeTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class SizeTests: XCTestCase {
    var win:UIWindow!
    var ctrler:UIViewController!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.mainScreen().bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSize() {
        let size:CGFloat = 10.0
        let v = UIView()
        ctrler.view.sv([v])
        v.size(size)
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v.frame.width, size, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, size, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testWidthAndHeight() {
        let width:CGFloat = 123
        let height:CGFloat = 47
        let v = UIView()
        ctrler.view.sv([v])
        v.height(height)
        v.width(width)
        v.layoutIfNeeded()  // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v.frame.width, width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, height, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testEqualSizes() {
        let width:CGFloat = 24
        let height:CGFloat = 267
        let v1 = UIView()
        let v2 = UIView()
        ctrler.view.sv([
            v1
            ,v2
        ])
        v1.height(height)
        v1.width(width)
        equalSizes([v1,v2])
        ctrler.view.layoutIfNeeded()  // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v1.frame.width, v2.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, v2.frame.height, accuracy: CGFloat(FLT_EPSILON))
    }
}
