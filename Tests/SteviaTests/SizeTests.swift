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
    
    var win: UIWindow!
    var ctrler: UIViewController!
    var v: UIView!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.main.bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        v = UIView()
        ctrler.view.subviews {
            v
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSizeDouble() {
        v.size(Double(57))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 57, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 57, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testSizeCGFloat() {
        v.size(CGFloat(57))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 57, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 57, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testSizeInt() {
        v.size(Int(57))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 57, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 57, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testWidthAndHeightDouble() {
        v.width(Double(36))
        v.height(Double(23))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 36, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 23, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testWidthAndHeightCGFloat() {
        v.width(CGFloat(36))
        v.height(CGFloat(23))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 36, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 23, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testWidthAndHeightInt() {
        v.width(Int(36))
        v.height(Int(23))
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 36, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 23, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testHeightPercentage() {
        v.width(100)
        v.height(40%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height*0.4, accuracy:0.5)
    }
    
    func testWidthPercentage() {
        v.height(100)
        v.width(87%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, ctrler.view.frame.width*0.87, accuracy: 0.5)
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testEqualSizes() {
        let width = 24.0
        let height = 267.0
        let v1 = UIView()
        let v2 = UIView()
        ctrler.view.subviews {
            v1
            v2
        }
        v1.height(height)
        v1.width(width)
        equal(sizes: [v1, v2])
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.width, v2.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, v2.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }

    func testVariadicEqualSizes() {
        let width = 24.0
        let height = 267.0
        let v1 = UIView()
        let v2 = UIView()
        ctrler.view.subviews {
            v1
            v2
        }
        v1.height(height)
        v1.width(width)
        equal(sizes: v1, v2)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.width, v2.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, v2.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }

    func testFollwEdges() {
        let v1 = UIView()
        let v2 = UIView()
        ctrler.view.subviews {
            v1
            v2
        }
        
        let test = ctrler.view
        
        test!.layout {
            10
            |-20-v1| ~ 32
        }
        

        ctrler.view.layoutIfNeeded()
        
        XCTAssertEqual(v1.frame.origin.y, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x,  20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, ctrler.view.frame.width - 20,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 32, accuracy: CGFloat(Float.ulpOfOne))
        
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        v2.followEdges(v1)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v2.frame.origin.y, v1.frame.origin.y,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, v1.frame.origin.x,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, v1.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, v1.frame.height, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    
    func testHeightEqualWidth() {
        v.heightEqualsWidth().width(85)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 85, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 85, accuracy: CGFloat(Float.ulpOfOne))

    }

    func testWidthEqualHeight() {
        v.height(192)
        v.heightEqualsWidth()
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 192, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 192, accuracy: CGFloat(Float.ulpOfOne))
        
    }
    
    func testSizeOnOrphanView() {
        v.removeFromSuperview()
        v.height(80)
        v.width(80)
        ctrler.view?.subviews { v }
        
        let view: UIView = ctrler.view
        view.layout {
            0
            |v!
        }
        
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.width, 80, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 80, accuracy: CGFloat(Float.ulpOfOne))
    }
}
