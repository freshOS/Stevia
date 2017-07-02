//
//  AssociatedBlockTests.swift
//  Stevia
//
//  Created by Blaz Merela on 01/07/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class AssociatedBlockTests: XCTestCase {

    func testButtonExecutesAssociatedBlock() {
        let button = UIButton()
        let e = expectation(description: "Associated block should be executed")
        button.tap {
            e.fulfill()
        }

        button.tapped()

        wait(for: [e], timeout: 1)
    }
    
    func testTextFieldExecutesAssociatedBlock() {
        let textfield = UITextField()
        let e = expectation(description: "Associated block should be executed")
        textfield.on(editing: .changed) {
            e.fulfill()
        }

        textfield.edited()

        wait(for: [e], timeout: 1)
    }
 
}
