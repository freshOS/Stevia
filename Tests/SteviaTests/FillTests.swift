//
//  FillTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor class FillTests {
    
    let win = UIWindow(frame: UIScreen.main.bounds)
    let ctrler = UIViewController()

    init() {
        win.rootViewController = ctrler
    }
    
    @Test
    func testFillContainer() {
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer()
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame == b.frame)
    }
    
    @Test
    func testFillContainerWithPaddingDouble() {
        let padding: Double = 10.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.height == b.frame.height + CGFloat(padding) * 2)
        #expect(ctrler.view.frame.width == b.frame.width + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillContainerWithPaddingCGFloat() {
        let padding: CGFloat = 10.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.height == b.frame.height + CGFloat(padding) * 2)
        #expect(ctrler.view.frame.width == b.frame.width + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillContainerWithPaddingInt() {
        let padding: Int = 10
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillContainer(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.height == b.frame.height + CGFloat(padding) * 2)
        #expect(ctrler.view.frame.width == b.frame.width + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillVertically() {
        let b = UIButton()
        ctrler.view.subviews { b }
        b.width(10)
        b.fillVertically()
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.height == b.frame.height)
        #expect(10 == b.frame.width)
    }
    
    @Test
    func testFillVerticallyWithPaddingDouble() {
        let padding: Double = 40.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillVertically(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.height == b.frame.height + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillVerticallyWithPaddingCGFloat() {
        let padding: CGFloat = 30.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillVertically(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.height == b.frame.height + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillVerticallyWithPaddingInt() {
        let padding: Int = 14
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillVertically(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.height == b.frame.height + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillHorizontallyWithPaddingDouble() {
        let padding: Double = 40.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillHorizontally(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.width == b.frame.width + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillHorizontallyWithPaddingCGFloat() {
        let padding: CGFloat = 30.0
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillHorizontally(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.width == b.frame.width + CGFloat(padding) * 2)
    }
    
    @Test
    func testFillHorizontallyWithPaddingInt() {
        let padding: Int = 14
        let b = UIButton()
        ctrler.view.subviews { b }
        b.fillHorizontally(padding: padding)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(ctrler.view.frame.width == b.frame.width + CGFloat(padding) * 2)
    }
}
