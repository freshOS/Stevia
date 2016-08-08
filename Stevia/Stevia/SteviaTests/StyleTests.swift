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

    func styleView(view: UIView) {
        view.backgroundColor = .yellow
    }
    
    func styleLabel(label: UILabel) {
        label.textColor = .yellow
    }

    func testStyle() {
        let label = UILabel()
        
        label.style(styleLabel).style(styleView)
        label.style(styleView).style(styleLabel)
        
        let view: UIView = label
        view.style(styleView)
        
        XCTAssertEqual(view.backgroundColor, .yellow)
        XCTAssertEqual(label.textColor, .yellow)
        
        //check type deduction
        label.style { (label) -> () in
            label.textColor = .blue
        }
        XCTAssertEqual(label.textColor, .blue)
    }


}
