//
//  LayoutTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor class LayoutTests {
    
    let win = UIWindow(frame: UIScreen.main.bounds)
    let ctrler = UIViewController()
    let v = UIView()
    
    init() {
        win.rootViewController = ctrler
        ctrler.view.subviews { v }
    }
    
    @Test
    func testComplexLayout() {
        let featureA = UIView()
        let featureB = UIView()
        
        let m1:Int = 6
        let m2:Int = 2
//        |-6-featureA-2-featureB-6-|
        |-m1-featureA-m2-featureB-m1-|
        //align(horizontally: |-6-feature1-2-feature2-6-|)
    }
    
    @Test
    func testEmptyLeftMargin() {
        |v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testEmptyLeftMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        |v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testDefaultMargin() {
        |-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 8)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testDefaultMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        |-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - 8)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testLeftMarginDouble() {
        |-Double(75)-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 75)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testLeftMarginCGFloat() {
        |-CGFloat(75)-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 75)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }

    @Test
    func testLeftMarginInt() {
        |-Int(75)-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 75)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testLeftMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        |-75-v
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - 75)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testEmptyRightMargin() {
        v|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testEmptyRightMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testDefaultRightMargin() {
        v-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 8)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testDefaultRightMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 8)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testRightMarginDouble() {
        v-Double(14)-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 14)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testRightMarginCGFloat() {
        v-CGFloat(14)-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 14)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testRightMarginInt() {
        v-Int(14)-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == ctrler.view.frame.width - v.frame.width - 14)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testRightMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v-14-|
        ctrler.view.layoutIfNeeded()
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 14)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }

    @Test
    func testHeightDouble() {
        v ~ Double(180)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 180)
    }
    
    @Test
    func testHeightCGFloat() {
        v ~ CGFloat(180)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 180)
    }
    
    @Test
    func testHeightInt() {
        v ~ Int(180)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 180)
    }
    
    @Test
    func testHeightPercentageDouble() {
        v ~ Double(25)%
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == ctrler.view.frame.height*0.25)
    }
    
    @Test
    func testHeightPercentageCGFloat() {
        v ~ CGFloat(25)%
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == ctrler.view.frame.height*0.25)
    }
    
    @Test
    func testHeightPercentageInt() {
        v ~ Int(25)%
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == ctrler.view.frame.height*0.25)
    }
    
    @Test
    func testMultipleHeightsAtOnceDouble() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        [v1, v2, v3] ~ Double(63)
        ctrler.view.layoutIfNeeded()
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 63)
        }
    }
    
    @Test
    func testMultipleHeightsAtOnceCGFloat() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        [v1, v2, v3] ~ CGFloat(63)
        ctrler.view.layoutIfNeeded()
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 63)
        }
    }
    
    @Test
    func testMultipleHeightsAtOnceInt() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        [v1, v2, v3] ~ Int(63)
        ctrler.view.layoutIfNeeded()
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 63)
        }
    }
    
    @Test
    func testDefaultMarginBetweenTwoViews() {
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
        
        |v1.width(10)-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 18)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
    
    @Test
    func testDefaultMarginBetweenTwoViewsRTL() {
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
        
        |v1.width(10)-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == ctrler.view.frame.width - 10)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == ctrler.view.frame.width - 10 - 8)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
    
    @Test
    func testMarginBetweenTwoViewsDouble() {
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
        let m: Double = 52
        |v1.width(10)-m-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 62)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
    
    @Test
    func testMarginBetweenTwoViewsCGFloat() {
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

        let m: CGFloat = 52
        |v1.width(10)-m-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)

        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 62)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
    
    func testMarginBetweenTwoViewsInt() {
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

        let m: Int = 52
        |v1.width(10)-m-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)

        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 62)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }

    @Test
    func testMarginBetweenTwoViewsRTL() {
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
        |v1.width(10)-52-v2
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == ctrler.view.frame.width - 10)
        #expect(v1.frame.width == 10)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == ctrler.view.frame.width - 10 - 52)
        #expect(v2.frame.width == 0)
        #expect(v2.frame.height == 0)
    }
    
    @Test
    func testArrayRightConstraint() {
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
        
        v1-52-v2.width(10)-31-|
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == ctrler.view.frame.width - 31 - v2.frame.width - 52)
        #expect(v1.frame.width == 0)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == ctrler.view.frame.width - 31 - v2.frame.width)
        #expect(v2.frame.width == 10)
        #expect(v2.frame.height == 0)
    }

    @Test
    func testArrayRightConstraintRTL() {
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
        
        v1-52-v2.width(10)-31-|
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 31 + v2.frame.width + 52)
        #expect(v1.frame.width == 0)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 31)
        #expect(v2.frame.width == 10)
        #expect(v2.frame.height == 0)
    }
    
    func testDefaultMarginBetweenThreeViews() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }

        |v1.width(20)⁃v2.width(20)⁃v3
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 28)
        #expect(v2.frame.width == 20)
        #expect(v2.frame.height == 0)
        #expect(v3.frame.origin.y == 0)
        #expect(v3.frame.origin.x == v2.frame.origin.x + v2.frame.width + 8)
        #expect(v3.frame.width == 0)
        #expect(v3.frame.height == 0)
    }
    
    @Test
    func testMarginsBetweenThreeViewsDouble() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        let m1: Double = 43
        let m2: Double = 27
        
        |v1.width(20)-m1-v2.width(20)-m2-v3
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == v1.frame.origin.x + v1.frame.width + 43)
        #expect(v2.frame.width == 20)
        #expect(v2.frame.height == 0)
        #expect(v3.frame.origin.y == 0)
        #expect(v3.frame.origin.x == v2.frame.origin.x + v2.frame.width + 27)
        #expect(v3.frame.width == 0)
        #expect(v3.frame.height == 0)
        
    }

    @Test
    func testMarginsBetweenThreeViewsCGFloat() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        let m1: CGFloat = 43
        let m2: CGFloat = 27
        
        |v1.width(20)-m1-v2.width(20)-m2-v3
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == v1.frame.origin.x + v1.frame.width + 43)
        #expect(v2.frame.width == 20)
        #expect(v2.frame.height == 0)
        #expect(v3.frame.origin.y == 0)
        #expect(v3.frame.origin.x == v2.frame.origin.x + v2.frame.width + 27)
        #expect(v3.frame.width == 0)
        #expect(v3.frame.height == 0)
    }

    @Test
    func testMarginsBetweenThreeViewsInt() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        let m1: Int = 43
        let m2: Int = 27
        
        |v1.width(20)-m1-v2.width(20)-m2-v3
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == v1.frame.origin.x + v1.frame.width + 43)
        #expect(v2.frame.width == 20)
        #expect(v2.frame.height == 0)
        #expect(v3.frame.origin.y == 0)
        #expect(v3.frame.origin.x == v2.frame.origin.x + v2.frame.width + 27)
        #expect(v3.frame.width == 0)
        #expect(v3.frame.height == 0)
    }
    
    func testMarginsBetweenThreeViewsRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
            v3
        }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        |v1.width(20)-43-v2.width(20)-27-v3
        ctrler.view.layoutIfNeeded()
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == ctrler.view.frame.width - 20)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == ctrler.view.frame.width - v1.frame.width - 43 - v2.frame.width)
        #expect(v2.frame.width == 20)
        #expect(v2.frame.height == 0)
        #expect(v3.frame.origin.y == 0)
        let val = ctrler.view.frame.width - v1.frame.width - 43 - v2.frame.width - 27
        #expect(v3.frame.origin.x == val)
        #expect(v3.frame.width == 0)
        #expect(v3.frame.height == 0)
    }

    @Test
    func testSpaceBetweenTwoViews() {
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
        
        |v1.width(20)-""-v2.width(20)|
        ctrler.view.layoutIfNeeded()
        
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == ctrler.view.frame.width - v2.frame.width)
        #expect(v2.frame.width == 20)
        #expect(v2.frame.height == 0)
    }

    @Test
    func testSpaceBetweenTwoViewsRTL() {
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
        
        |v1.width(20)-""-v2.width(20)|
        ctrler.view.layoutIfNeeded()
        
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == ctrler.view.frame.width - v1.frame.width)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == 0)
        #expect(v2.frame.width == 20)
        #expect(v2.frame.height == 0)
    }

    @Test
    func testSpaceWithArrayOfViews() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews { v1; v2; v3 }
        for view in ctrler.view.subviews {
            #expect(view.frame.origin.y == 0)
            #expect(view.frame.origin.x == 0)
            #expect(view.frame.width == 0)
            #expect(view.frame.height == 0)
        }
        
        |v1.width(20)-v2.width(30)-""-v3.width(10)|
        ctrler.view.layoutIfNeeded()
        
        #expect(v1.frame.origin.y == 0)
        #expect(v1.frame.origin.x == 0)
        #expect(v1.frame.width == 20)
        #expect(v1.frame.height == 0)
        
        #expect(v2.frame.origin.y == 0)
        #expect(v2.frame.origin.x == v1.frame.width + 8)
        #expect(v2.frame.width == 30)
        #expect(v2.frame.height == 0)
        
        #expect(v3.frame.origin.y == 0)
        #expect(v3.frame.origin.x == ctrler.view.frame.width - v3.frame.width)
        #expect(v3.frame.width == 10)
        #expect(v3.frame.height == 0)
    }
    
    @Test
    func verifyViewHasDefaultValues() {
        #expect(v.frame.origin.y == 0)
        #expect(v.frame.origin.x == 0)
        #expect(v.frame.width == 0)
        #expect(v.frame.height == 0)
    }
}
