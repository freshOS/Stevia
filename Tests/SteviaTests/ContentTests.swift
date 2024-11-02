//
//  ContentTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

let title = "TitleTest"

@Suite
@MainActor struct UIButtonContentTests {
    
    var button = UIButton()

    init() {
        button = UIButton()
    }
    
    @Test
    func testText() {
        button.text(title)
        #expect(button.currentTitle == title)
        #expect(button.state == .normal)
    }
    
    @Test
    func testTextKey() {
        button.textKey(title)
        #expect(button.currentTitle == title)
    }
}


@Suite
@MainActor struct UILabelContentTests {
    
    let label = UILabel()
    
    @Test
    func testText() {
        label.text(title)
        #expect(label.text == title)
    }
    
    @Test
    func testTextKey() {
        label.textKey(title)
        #expect(label.text == title)
    }
}

@Suite
@MainActor struct UITextFieldContentTests {
    
    let textField = UITextField()
    
    @Test
    func testPlaceholder() {
        textField.placeholder(title)
        #expect(textField.placeholder == title)
    }
}

@Suite
@MainActor struct UIImageViewContentTests {
    
    let imageView = UIImageView()

    @Test
    func testImage() {
        imageView.image("foo")
        //XCTAssertEqual(button.currentImage, title)
    }
}
