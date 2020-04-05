//
//  FillTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest

import Stevia

class FillTests: XCTestCase {
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

    func testFillContainer() {
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer()
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame, b.frame)
    }
    
    func testFillContainerWithPaddingDouble() {
        let padding: Double = 10.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.height, b.frame.height + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(ctrler.view.frame.width, b.frame.width + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillContainerWithPaddingCGFloat() {
        let padding: CGFloat = 10.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.height, b.frame.height + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(ctrler.view.frame.width, b.frame.width + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillContainerWithPaddingInt() {
        let padding: Int = 10
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.height, b.frame.height + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(ctrler.view.frame.width, b.frame.width + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillVertically() {
        let b = UIButton()
        ctrler.view.subviews { b }
        b.width(10)
        b.fillVertically()
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.height, b.frame.height)
        XCTAssertEqual(10, b.frame.width)
    }
    
    func testFillVerticallyWithPaddingDouble() {
        let padding: Double = 40.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillVertically(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.height, b.frame.height + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillVerticallyWithPaddingCGFloat() {
        let padding: CGFloat = 30.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillVertically(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.height, b.frame.height + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillVerticallyWithPaddingInt() {
        let padding: Int = 14
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillVertically(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.height, b.frame.height + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillHorizontallyWithPaddingDouble() {
        let padding: Double = 40.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillHorizontally(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.width, b.frame.width + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillHorizontallyWithPaddingCGFloat() {
        let padding: CGFloat = 30.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillHorizontally(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.width, b.frame.width + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testFillHorizontallyWithPaddingInt() {
        let padding: Int = 14
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillHorizontally(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(ctrler.view.frame.width, b.frame.width + CGFloat(padding) * 2,
                                   accuracy: CGFloat(Float.ulpOfOne))
    }
}
