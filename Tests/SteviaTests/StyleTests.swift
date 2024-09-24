//
//  StyleTests.swift
//  Stevia
//
//  Created by krzat on 17/03/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor struct StyleTests {

    func styleView(_ view: UIView) {
        view.backgroundColor = UIColor.yellow
    }
    
    func styleLabel(_ label: UILabel) {
        label.textColor = UIColor.yellow
    }

    @Test
    func canCallStyle() {
        let label = UILabel()
        
        label.style(styleLabel).style(styleView)
        label.style(styleView).style(styleLabel)
        
        let view: UIView = label
        view.style(styleView)
        
        #expect(view.backgroundColor == UIColor.yellow)
        #expect(label.textColor == UIColor.yellow)
        
        //check type deduction
        label.style { (label) -> () in
            label.textColor = UIColor.blue
        }
        #expect(label.textColor == UIColor.blue)
    }
}
