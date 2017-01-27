//
//  EquationTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 27/01/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class EquationTests: XCTestCase {
    
    var win: UIWindow!
    var ctrler: UIViewController!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.main.bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTop() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Top == ctrler.view.Top + 10
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testBottom() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Bottom == ctrler.view.Bottom - 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testLeft() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Left == ctrler.view.Left + 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testRight() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Right == ctrler.view.Right - 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testWidth() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Width == ctrler.view.Width - 52
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, ctrler.view.frame.width - 52)
    }
    
    func testHeight() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Height == ctrler.view.Height + 34
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height + 34)
    }

    // Single Value
    
    func testSingleValueTop() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Top == 10
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueBottom() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Bottom == 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testSingleValueLeft() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Left == 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testSingleValueRight() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Right == 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testSingleValueWidth() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Width == 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, 23)
    }
    
    func testSingleValueHeight() {
        let v = UIView()
        ctrler.view.sv(v)
        v.Height == 94
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, 94)
    }
}
