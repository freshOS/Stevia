//
//  GetConstraintsTests.swift
//  Stevia
//
//  Created by Sacha DSO on 14/06/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor struct GetConstraintsTests {
    
    let v = UIView()
    let spv = UIView()
    
    init() {
        spv.subviews { v }
    }
    
    @Test
    func canGetLeftConstraint() throws {
        #expect(v.leftConstraint == nil)
        v.left(10)
        let c = try #require(v.leftConstraint)
        #expect(c.constant == 10)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .left)
        #expect(c.secondAttribute == .left)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
    
    @Test
    func canGetRightConstraint() throws {
        #expect(v.rightConstraint == nil)
        v.right(42)
        let c = try #require(v.rightConstraint)
        #expect(c.constant == -42)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .right)
        #expect(c.secondAttribute == .right)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
    
    @Test
    func canGetTopConstraint() throws {
        #expect(v.topConstraint == nil)
        v.top(23)
        let c = try #require(v.topConstraint)
        #expect(c.constant == 23)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .top)
        #expect(c.secondAttribute == .top)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
    
    @Test
    func testCanGetBottomConstraint() throws {
        #expect(v.bottomConstraint == nil)
        v.bottom(145)
        let c = try #require(v.bottomConstraint)
        #expect(c.constant == -145)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .bottom)
        #expect(c.secondAttribute == .bottom)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
    
    @Test
    func testCanGetHeightConstraint() throws {
        #expect(v.heightConstraint == nil)
        v.height(35)
        let c = try #require(v.heightConstraint)
        #expect(c.constant == 35)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem == nil)
        #expect(c.firstAttribute == .height)
        #expect(c.secondAttribute == .notAnAttribute)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
    
    @Test
    func canGetWidthConstraint() throws {
        #expect(v.widthConstraint == nil)
        v.width(51)
        let c = try #require(v.widthConstraint)
        #expect(c.constant == 51)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem == nil)
        #expect(c.firstAttribute == .width)
        #expect(c.secondAttribute == .notAnAttribute)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
    
    @Test
    func canGetTrailingConstraint() throws {
        #expect(v.trailingConstraint == nil)
        v.trailingAnchor.constraint(equalTo: spv.trailingAnchor, constant: 104).isActive = true
        let c = try #require(v.trailingConstraint)
        #expect(c.constant == 104)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .trailing)
        #expect(c.secondAttribute == .trailing)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 1000)
        #expect(c.isActive)
    }
    
    @Test
    func canGetLeadingonstraint() throws {
        #expect(v.leadingConstraint == nil)
        v.leadingAnchor.constraint(equalTo: spv.leadingAnchor, constant: 73).isActive = true
        let c = try #require(v.leadingConstraint)
        #expect(c.constant == 73)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .leading)
        #expect(c.secondAttribute == .leading)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 1000)
        #expect(c.isActive)
    }
    
    @Test
    func canGetCenterXConstraint() throws {
        #expect(v.centerXConstraint == nil)
        v.CenterX == spv.CenterX + 27
        let c = try #require(v.centerXConstraint)
        #expect(c.constant == 27)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .centerX)
        #expect(c.secondAttribute == .centerX)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
    
    @Test
    func canGetCenterYConstraint() throws {
        #expect(v.centerYConstraint == nil)
        v.CenterY == spv.CenterY - 32
        let c = try #require(v.centerYConstraint)
        #expect(c.constant == -32)
        #expect(c.firstItem as? UIView == v)
        #expect(c.secondItem as? UIView == spv)
        #expect(c.firstAttribute == .centerY)
        #expect(c.secondAttribute == .centerY)
        #expect(c.multiplier == 1)
        #expect(c.relation == .equal)
        #expect(c.priority.rawValue == 751)
        #expect(c.isActive)
    }
}
