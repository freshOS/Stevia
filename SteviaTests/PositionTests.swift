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
        ctrler.view.sv(v)
        v.size(100.0)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTop() {
        v.top(23)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 23, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testBottom() {
        v.bottom(45)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - v.frame.height - 45,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeft() {
        v.left(12)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeading() {
        v.leading(12)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 12, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRight() {
        v.right(74)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  ctrler.view.frame.width - v.frame.width - 74,
                       accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testTrailing() {
        v.trailing(74)
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
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (90/100) - v.frame.width, accuracy: CGFloat(0.1))
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
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (90/100) - v.frame.width, accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.width, 100, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 100, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testPercentLeadingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.leading(10%)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0 , accuracy: CGFloat(0.1))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width * (90/100) - v.frame.width, accuracy: CGFloat(0.1))
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
