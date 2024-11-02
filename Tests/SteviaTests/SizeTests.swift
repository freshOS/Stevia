//
//  SizeTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor struct SizeTests {
    
    let win = UIWindow(frame: UIScreen.main.bounds)
    let ctrler = UIViewController()
    let v = UIView()
    
    init() {
        win.rootViewController = ctrler
        ctrler.view.subviews {
            v
        }
    }
    
    @Test
    func testAspectRatioDouble() {
        v.width(150).aspectRatio(Double(3.0/2.0))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 150)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testAspectRatioCGFloat() {
        v.width(150).aspectRatio(CGFloat(3.0/2.0))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 150)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testAspectRatioInt() {
        v.width(150).aspectRatio(Int(3))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 150)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testAspectRatioPercentage() {
        v.width(150).aspectRatio(150%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 150)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testSizeDouble() {
        v.size(Double(57))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 57)
        #expect(v.frame.height == 57)
    }
    
    @Test
    func testSizeCGFloat() {
        v.size(CGFloat(57))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 57)
        #expect(v.frame.height == 57)
    }
    
    @Test
    func testSizeInt() {
        v.size(Int(57))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 57)
        #expect(v.frame.height == 57)
    }
    
    @Test
    func testWidthAndHeightDouble() {
        v.width(Double(36))
        v.height(Double(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 36)
        #expect(v.frame.height == 23)
    }
    
    @Test
    func testWidthAndHeightCGFloat() {
        v.width(CGFloat(36))
        v.height(CGFloat(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 36)
        #expect(v.frame.height == 23)
    }
    
    @Test
    func testWidthAndHeightInt() {
        v.width(Int(36))
        v.height(Int(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 36)
        #expect(v.frame.height == 23)
    }
    
    @Test
    func testHeightPercentage() {
        v.width(100)
        v.height(40%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(isApproximatelyEqual(v.frame.height, ctrler.view.frame.height*0.4))
    }
    
    @Test
    func testWidthPercentage() {
        v.height(100)
        v.width(87%)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.height == 100)
        #expect(isApproximatelyEqual(v.frame.width, ctrler.view.frame.width*0.87))
    }
    
    @Test
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
        #expect(v1.frame.width == v2.frame.width)
        #expect(v1.frame.height == v2.frame.height)
    }

    @Test
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
        #expect(v1.frame.width == v2.frame.width)
        #expect(v1.frame.height == v2.frame.height)
    }

    @Test
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
        
        #expect(v1.frame.origin.y == 10)
        #expect(v1.frame.origin.x == 20)
        #expect(v1.frame.width == ctrler.view.frame.width - 20)
        #expect(v1.frame.height == 32)

        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 0)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)

        v2.followEdges(v1)
        ctrler.view.layoutIfNeeded()
        #expect(v2.frame.origin.y == v1.frame.origin.y)
        #expect(v2.frame.origin.x == v1.frame.origin.x)
        #expect(v2.frame.width == v1.frame.width)
        #expect(v2.frame.height == v1.frame.height)
    }

    @Test
    func testHeightEqualWidth() {
        v.heightEqualsWidth().width(85)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 85)
        #expect(v.frame.height == 85)
    }

    @Test
    func testWidthEqualHeight() {
        v.height(192)
        v.heightEqualsWidth()
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 192)
        #expect(v.frame.height == 192)
    }
    
    @Test
    func testSizeOnOrphanView() {
        v.removeFromSuperview()
        v.height(80)
        v.width(80)
        ctrler.view?.subviews { v }
    
        let view: UIView = ctrler.view
        view.layout {
            0
            |v
        }
        
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.width == 80)
        #expect(v.frame.height == 80)
    }
}
