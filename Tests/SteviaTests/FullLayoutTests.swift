//
//  FullLayoutTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

class TestView: UIView {
    
    let email = UITextField()
    let password = UITextField()
    let login = UIButton()
    
    let view1 = UIView()
    let view2 = UIView()
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        subviews {
            email
            password
            login
        }
  
        layout {
            100.5
            |-email-22-| ~ 10%
            20
            |password.width(54) ~ 47.0
            >=0
            login.centerHorizontally() ~ 99
            7
        }
        
        subviews {
            view1
            view2
        }
        
        layout {
            10%
            |view1| ~ 20
            33%
            |view2|
            20%
        }
        
    }
}

@Suite
@MainActor class FullLayoutTests {
        
    let win = UIWindow(frame: UIScreen.main.bounds)
    let vc = UIViewController()
    let v = TestView()
    
    init() {
        win.rootViewController = vc
        v.frame = vc.view.frame
        vc.view = v
    }
    
    @Test
    func testFullLayout() {
        #expect(vc.view.frame.origin.x == 0)
        #expect(vc.view.frame.origin.y == 0)
        #expect(vc.view.frame.width == win.frame.width)
        #expect(vc.view.frame.height == win.frame.height)
        
        v.layoutIfNeeded()

        // Email
        #expect(isApproximatelyEqual(v.email.frame.origin.y, 100.5))
        #expect(v.email.frame.origin.x == 8)
        #expect(v.email.frame.width == win.frame.width - 8 - 22)
        #expect(isApproximatelyEqual(v.email.frame.height, win.frame.height*0.1))
        
        // Password
        #expect(isApproximatelyEqual(v.password.frame.origin.y, v.email.frame.origin.y+v.email.frame.height + 20))
        #expect(v.password.frame.origin.x == 0)
        #expect(v.password.frame.width == 54)
        #expect(v.password.frame.height == 47)
        
        // Password
        #expect(v.login.frame.origin.y == win.frame.height - v.login.frame.height - 7)
        #expect(isApproximatelyEqual(v.login.frame.origin.x, win.frame.width/2.0 - (v.login.frame.width/2.0)))
        #expect(v.login.frame.height == 99)
    }
    
    @Test
    func testFullLayoutRTL() {
        vc.view.semanticContentAttribute = .forceRightToLeft
        #expect(vc.view.frame.origin.x == 0)
        #expect(vc.view.frame.origin.y == 0)
        #expect(vc.view.frame.width == win.frame.width)
        #expect(vc.view.frame.height == win.frame.height)
        
        v.layoutIfNeeded()

        // Email
        #expect(isApproximatelyEqual(v.email.frame.origin.y, 100.5))
        #expect(v.email.frame.origin.x == 22)
        #expect(v.email.frame.width == win.frame.width - 8 - 22)
        #expect(isApproximatelyEqual(v.email.frame.height, win.frame.height*0.1))

        // Password
        #expect(isApproximatelyEqual(v.password.frame.origin.y, v.email.frame.origin.y+v.email.frame.height + 20))
        #expect(v.password.frame.origin.x == vc.view.frame.width - 54)
        #expect(v.password.frame.width == 54)
        #expect(v.password.frame.height == 47)
        
        // Password
        #expect(v.login.frame.origin.y == win.frame.height - v.login.frame.height - 7)
        #expect(isApproximatelyEqual(v.login.frame.origin.x, win.frame.width/2.0 - (v.login.frame.width/2.0)))
        #expect(v.login.frame.height == 99)
    }

    @Test
    func testPercentLayout() {
        #expect(vc.view.frame.origin.x == 0)
        #expect(vc.view.frame.origin.y == 0)
        #expect(vc.view.frame.width == win.frame.width)
        #expect(vc.view.frame.height == win.frame.height)
        
        v.layoutIfNeeded()
        
        #expect(isApproximatelyEqual(v.view1.frame.origin.y, v.frame.height*0.1))
        #expect(v.view1.frame.origin.x == 0)
        #expect(v.view1.frame.width == v.frame.width)
        #expect(isApproximatelyEqual(v.view2.frame.origin.y, (v.frame.height*0.1) + 20 + (v.frame.height*0.33)))
        #expect(v.view2.frame.origin.x == 0)
        #expect(isApproximatelyEqual(v.view2.frame.origin.y + v.view2.frame.height, (v.frame.height*0.8)))
        #expect(v.view2.frame.width == v.frame.width)
    }
}
