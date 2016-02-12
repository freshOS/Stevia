//
//  HierarchyTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest

import Stevia

class HierarchyTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSv() {
        let ui = UIView()
        var inner = [UIView]()
        
        inner.append(UIButton())
        
        ui.sv(inner)
        XCTAssertEqual(ui.subviews.count, 1)
        
        inner.removeAll()
        inner.append(UIButton())
        inner.append(UILabel())
        
        ui.sv(inner)
        XCTAssertEqual(ui.subviews.count, 3)
    }
}
