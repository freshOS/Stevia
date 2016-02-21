//
//  SizeTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest

class SizeTests: XCTestCase {
    var win:UIWindow!
    var ctrler:UIViewController!
    
    override func setUp() {
        win = UIWindow(frame: UIScreen.mainScreen().bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSize() {
        let size:CGFloat = 10.0
        let v = UIView()
        ctrler.view.sv([v])
        v.size(size)
        v.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        XCTAssertEqualWithAccuracy(v.frame.width, size, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(v.frame.height, size, accuracy: CGFloat(FLT_EPSILON))
    }
}
