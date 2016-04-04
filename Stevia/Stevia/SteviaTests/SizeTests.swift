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
    var v:UIView!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.mainScreen().bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        v = UIView()
        ctrler.view.sv([v])
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSize() {
        v.size(57)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 57, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 57, accuracy: CGFloat(FLT_EPSILON))
    }
    
    func testWidthAndHeight() {
        v.width(36)
        v.height(23)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 36, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 23, accuracy: CGFloat(FLT_EPSILON))
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
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.width, v2.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, v2.frame.height, accuracy: CGFloat(FLT_EPSILON))
    }

    func testVariadicEqualSizes() {
        let width:CGFloat = 24
        let height:CGFloat = 267
        let v1 = UIView()
        let v2 = UIView()
        ctrler.view.sv(
            v1
            ,v2
            )
        v1.height(height)
        v1.width(width)
        equalSizes(v1,v2)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v1.frame.width, v2.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, v2.frame.height, accuracy: CGFloat(FLT_EPSILON))
    }

    func testFollwEdges() {
        let v1 = UIView()
        let v2 = UIView()
        ctrler.view.sv([
            v1
            ,v2
            ])
        
        ctrler.view.layout([
            10,
            |-20-v1| ~ 32
        ])

        ctrler.view.layoutIfNeeded()
        
        XCTAssertEqualWithAccuracy(v1.frame.origin.y, 10, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.origin.x,  20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.width, ctrler.view.frame.width - 20, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v1.frame.height, 32, accuracy: CGFloat(FLT_EPSILON))
        
        
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x,  0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, 0, accuracy: CGFloat(FLT_EPSILON))
        
        v2.followEdges(v1)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v2.frame.origin.y, v1.frame.origin.y, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.origin.x, v1.frame.origin.x, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.width, v1.frame.width, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v2.frame.height, v1.frame.height, accuracy: CGFloat(FLT_EPSILON))
    }
    
    
    func testHeightEqualWidth() {
        v.heightEqualsWidth().width(85)
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 85, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 85, accuracy: CGFloat(FLT_EPSILON))

    }

    func testWidthEqualHeight() {
        v.height(192)
        v.heightEqualsWidth()
        v.layoutIfNeeded()
        XCTAssertEqualWithAccuracy(v.frame.origin.y, 0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.origin.x,  0, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.width, 192, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, 192, accuracy: CGFloat(FLT_EPSILON))
        
    }
}
