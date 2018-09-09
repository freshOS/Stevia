//
//  BaselineTests.swift
//  SteviaTests
//
//  Created by Sacha on 09/09/2018.
//  Copyright © 2018 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class BaselineTests: XCTestCase {
    
    var win: UIWindow!
    var ctrler: UIViewController!
    var label1: UILabel!
    var label2: UILabel!
    
    override func setUp() {
        win = UIWindow(frame: UIScreen.main.bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        label1 = UILabel()
        label2 = UILabel()
        ctrler.view.sv(
            label1,
            label2
        )
    }
    
    func testAlignLastBaselines() {
        label1.top(100)
        align(lastBaselines: label1, label2)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(label1.forLastBaselineLayout.frame.minY, label2.forLastBaselineLayout.frame.minY)
    }
    
    func testAlignFirstBaselines() {
        label1.top(100)
        align(firstBaselines: label1, label2)
        ctrler.view.layoutIfNeeded()
        XCTAssertEqual(label1.forLastBaselineLayout.frame.minY, label2.forLastBaselineLayout.frame.minY)
    }
}

