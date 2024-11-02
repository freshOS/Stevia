//
//  FlexibleMarginTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor struct FlexibleMarginTests {
        
    let win = UIWindow(frame: UIScreen.main.bounds)
    let ctrler = UIViewController()
    let v = UIView()
    
    init() {
        win.rootViewController = ctrler
        ctrler.view.subviews { v }
        v.size(100.0)
    }
    
    @Test
    func testGreaterTopDouble() {
        v.top(>=Double(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterTopCGFloat() {
        v.top(>=CGFloat(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterTopInt() {
        v.top(>=Int(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterBottom() {
        v.bottom(>=45)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == ctrler.view.frame.height - v.frame.height - 45)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterLeft() {
        v.left(>=23)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterLeading() {
        v.leading(>=23)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterLeadingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.leading(>=23)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }

    @Test
    func testGreaterRight() {
        v.right(>=74)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterTrailing() {
        v.trailing(>=74)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testGreaterTrailingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.trailing(>=74)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessTopDouble() {
        v.top(<=Double(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessTopCGFloat() {
        v.top(<=CGFloat(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessTopInt() {
        v.top(<=Int(23))
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 23)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessBottom() {
        v.bottom(<=45)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == ctrler.view.frame.height - v.frame.height - 45)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessLeft() {
        v.left(<=23)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessLeading() {
        v.leading(<=23)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessLeadingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.leading(<=23)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessLeftOperator() {
        |-(<=23)-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessLeftOperatorRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        |-(<=23)-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 23)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessRight() {
        v.right(<=74)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessTrailing() {
        v.trailing(<=74)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }

    @Test
    func testLessTrailingRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v.trailing(<=74)
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessRightOperator() {
        v-(<=74)-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testLessRightOperatorRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v-(<=74)-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 74)
        #expect(v.frame.width == 100)
        #expect(v.frame.height == 100)
    }
    
    @Test
    func testMarginGreaterBetweenTwoViews() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews { v1; v2 }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        |v1.width(10)-(>=25)-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 35)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
    
    @Test
    func testMarginGreaterBetweenTwoViewsRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        |v1.width(10)-(>=25)-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == ctrler.view.frame.width - 10)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == ctrler.view.frame.width - v1.frame.width - 25)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
        
    }
    
    @Test
    func testMarginLesserBetweenTwoViews() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        |v1.width(10)-(<=25)-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 35)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
    
    @Test
    func testMarginLesserBetweenTwoViewsRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        |v1.width(10)-(<=25)-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == ctrler.view.frame.width - 10)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == ctrler.view.frame.width - v1.frame.width - 25)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
}
