//
//  BaselineTests.swift
//  SteviaTests
//
//  Created by Sacha on 09/09/2018.
//  Copyright © 2018 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit
import Stevia
import Testing

@Suite
@MainActor struct BaselineTests {
    
    let win = UIWindow(frame: UIScreen.main.bounds)
    let ctrler = UIViewController()
    let label1 = UILabel()
    let label2 = UILabel()
    
    init() {
        win.rootViewController = ctrler
        ctrler.view.subviews {
            label1
            label2
        }
    }
    
    @Test
    func alignLastBaselines() {
        label1.top(100)
        align(lastBaselines: label1, label2)
        ctrler.view.layoutIfNeeded()
        #expect(label1.forLastBaselineLayout.frame.minY == label2.forLastBaselineLayout.frame.minY)
    }
    
    @Test
    func alignFirstBaselines() {
        label1.top(100)
        align(firstBaselines: label1, label2)
        ctrler.view.layoutIfNeeded()
        #expect(label1.forLastBaselineLayout.frame.minY == label2.forLastBaselineLayout.frame.minY)
    }
}

