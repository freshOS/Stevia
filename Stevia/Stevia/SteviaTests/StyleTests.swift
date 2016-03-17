//
//  StyleTests.swift
//  Stevia
//
//  Created by krzat on 17/03/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class StyleTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func styleView(view : UIView) {
        view.backgroundColor = UIColor.yellowColor()
    }
    
    func styleLabel(label : UILabel) {
        label.textColor = UIColor.yellowColor()
    }

    func testStyle() {
        let label = UILabel()
        
        label.style(styleLabel).style(styleView)
        label.style(styleView).style(styleLabel)
        
        let view : UIView = label
        view.style(styleView)
        
        XCTAssertEqual(view.backgroundColor, UIColor.yellowColor())
        XCTAssertEqual(label.textColor, UIColor.yellowColor())
        
        //check type deduction
        label.style { (label) -> () in
            label.textColor = UIColor.blueColor()
        }
        XCTAssertEqual(label.textColor, UIColor.blueColor())
    }


}
