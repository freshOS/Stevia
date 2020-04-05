//
//  LayoutTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class LayoutTests: XCTestCase {
    
    var win: UIWindow!
    var ctrler: UIViewController!
    var v: UIView!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.main.bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        v = UIView()
        ctrler.view.subviews { v }
        verifyViewHasDefaultValues()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testComplexLayout() {
        let featureA = UIView()
        let featureB = UIView()
        
        let m1:Int = 6
        let m2:Int = 2
//        |-6-featureA-2-featureB-6-|
        |-m1-featureA-m2-featureB-m1-|
        //align(horizontally: |-6-feature1-2-feature2-6-|)
    }
    
    func testEmptyLeftMargin() {
        |v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x,  0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testEmptyLeftMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        |v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testDefaultMargin() {
        |-v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 8, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testDefaultMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        |-v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 8, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeftMarginDouble() {
        |-Double(75)-v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 75, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeftMarginCGFloat() {
        |-CGFloat(75)-v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 75, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }

    func testLeftMarginInt() {
        |-Int(75)-v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 75, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testLeftMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        |-75-v
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 75, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testEmptyRightMargin() {
        v|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - v.frame.width,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testEmptyRightMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testDefaultRightMargin() {
        v-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - v.frame.width - 8,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testDefaultRightMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 8,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRightMarginDouble() {
        v-Double(14)-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - v.frame.width - 14,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRightMarginCGFloat() {
        v-CGFloat(14)-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - v.frame.width - 14,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRightMarginInt() {
        v-Int(14)-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - v.frame.width - 14,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testRightMarginRTL() {
        ctrler.view.semanticContentAttribute = .forceRightToLeft
        v-14-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 14,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }

    func testHeightDouble() {
        v ~ Double(180)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 180, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testHeightCGFloat() {
        v ~ CGFloat(180)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 180, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testHeightInt() {
        v ~ Int(180)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 180, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testHeightPercentageDouble() {
        v ~ Double(25)%
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height*0.25, accuracy: 0.5)
    }
    
    func testHeightPercentageCGFloat() {
        v ~ CGFloat(25)%
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height*0.25, accuracy: 0.5)
    }
    
    func testHeightPercentageInt() {
        v ~ Int(25)%
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height*0.25, accuracy: 0.5)
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        [v1, v2, v3] ~ Double(63)
        ctrler.view.layoutIfNeeded()
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 63, accuracy: CGFloat(Float.ulpOfOne))
        }
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        [v1, v2, v3] ~ CGFloat(63)
        ctrler.view.layoutIfNeeded()
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 63, accuracy: CGFloat(Float.ulpOfOne))
        }
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        [v1, v2, v3] ~ Int(63)
        ctrler.view.layoutIfNeeded()
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 63, accuracy: CGFloat(Float.ulpOfOne))
        }
    }
    
    func testDefaultMarginBetweenTwoViews() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        |v1.width(10)-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, 18, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        |v1.width(10)-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, ctrler.view.frame.width - 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, ctrler.view.frame.width - 10 - 8, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testMarginBetweenTwoViewsDouble() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        let m: Double = 52
        |v1.width(10)-m-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, 62, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testMarginBetweenTwoViewsCGFloat() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }

        let m: CGFloat = 52
        |v1.width(10)-m-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))

        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, 62, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }

        let m: Int = 52
        |v1.width(10)-m-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))

        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, 62, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        |v1.width(10)-52-v2
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, ctrler.view.frame.width - 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, ctrler.view.frame.width - 10 - 52, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testArrayRightConstraint() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        v1-52-v2.width(10)-31-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x,
                                   ctrler.view.frame.width - 31 - v2.frame.width - 52,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x,
                                   ctrler.view.frame.width - 31 - v2.frame.width,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        v1-52-v2.width(10)-31-|
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 31 + v2.frame.width + 52,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, 31, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        

        |v1.width(20)⁃v2.width(20)⁃v3
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, 28, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.x, v2.frame.origin.x + v2.frame.width + 8,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        let m1: Double = 43
        let m2: Double = 27
        
        |v1.width(20)-m1-v2.width(20)-m2-v3
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, v1.frame.origin.x + v1.frame.width + 43,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.x, v2.frame.origin.x + v2.frame.width + 27,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        let m1: CGFloat = 43
        let m2: CGFloat = 27
        
        |v1.width(20)-m1-v2.width(20)-m2-v3
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, v1.frame.origin.x + v1.frame.width + 43,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.x, v2.frame.origin.x + v2.frame.width + 27,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        let m1: Int = 43
        let m2: Int = 27
        
        |v1.width(20)-m1-v2.width(20)-m2-v3
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, v1.frame.origin.x + v1.frame.width + 43,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.x, v2.frame.origin.x + v2.frame.width + 27,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        |v1.width(20)-43-v2.width(20)-27-v3
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, ctrler.view.frame.width - 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, ctrler.view.frame.width - v1.frame.width - 43 - v2.frame.width,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.x, ctrler.view.frame.width - v1.frame.width - 43 - v2.frame.width - 27,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
    }
    
    func testSpaceBetweenTwoViews() {
        let v1 = UIView()
        let v2 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews {
            v1
            v2
        }
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        |v1.width(20)-""-v2.width(20)|
        ctrler.view.layoutIfNeeded()
        
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, ctrler.view.frame.width - v2.frame.width,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
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
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        |v1.width(20)-""-v2.width(20)|
        ctrler.view.layoutIfNeeded()
        
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, ctrler.view.frame.width - v1.frame.width, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, 0,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func testSpaceWithArrayOfViews() {
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v.removeFromSuperview()
        ctrler.view.subviews { v1; v2; v3 }
        for view in ctrler.view.subviews {
            XCTAssertEqual(view.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
            XCTAssertEqual(view.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        }
        
        |v1.width(20)-v2.width(30)-""-v3.width(10)|
        ctrler.view.layoutIfNeeded()
        
        XCTAssertEqual(v1.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.width, 20, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v1.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v2.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.origin.x, v1.frame.width + 8,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.width, 30, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v2.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
        
        XCTAssertEqual(v3.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.origin.x, ctrler.view.frame.width - v3.frame.width,
                                   accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.width, 10, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v3.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
    
    func verifyViewHasDefaultValues() {
        XCTAssertEqual(v.frame.origin.y, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.origin.x, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.width, 0, accuracy: CGFloat(Float.ulpOfOne))
        XCTAssertEqual(v.frame.height, 0, accuracy: CGFloat(Float.ulpOfOne))
    }
}
