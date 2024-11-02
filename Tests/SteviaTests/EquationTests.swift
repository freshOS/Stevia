//
//  EquationTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 27/01/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor struct EquationTests {
    
    let win = UIWindow(frame: UIScreen.main.bounds)
    let ctrler = UIViewController()
    
    init() {
        win.rootViewController = ctrler
    }
    
    @Test
    func testTopDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == ctrler.view.Top + Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testTopCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == ctrler.view.Top + CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testTopInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == ctrler.view.Top + Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testTopReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Top + 10 == v.Top
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testTopGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= ctrler.view.Top + 10
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testTopLessThanOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= ctrler.view.Top + 10
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testBottomDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == ctrler.view.Bottom - Double(23)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testBottomCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == ctrler.view.Bottom - CGFloat(23)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testBottomInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == ctrler.view.Bottom - Int(23)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testBottomReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Bottom - 23 == v.Bottom
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testBottomGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom >= ctrler.view.Bottom - 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testBottomLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom <= ctrler.view.Bottom - 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testLeft() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left == ctrler.view.Left + 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == 72)
    }
    
    @Test
    func testLeftReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Left + 72 == v.Left
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == 72)
    }
    
    @Test
    func testLeftGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left >= ctrler.view.Left + 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == 72)
    }
    
    @Test
    func testLeftLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left <= ctrler.view.Left + 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == 72)
    }
    
    @Test
    func testRight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right == ctrler.view.Right - 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == ctrler.view.frame.width - 13)
    }
    
    @Test
    func testRightReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Right - 13 == v.Right
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == ctrler.view.frame.width - 13)
    }
    
    @Test
    func testRightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right >= ctrler.view.Right - 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == ctrler.view.frame.width - 13)
    }
    
    @Test
    func testRightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right >= ctrler.view.Right - 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == ctrler.view.frame.width - 13)
    }
    
    @Test
    func testWidth() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width == ctrler.view.Width - 52
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.width == ctrler.view.frame.width - 52)
    }
    
    @Test
    func testWidthReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Width - 52 == v.Width
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.width == ctrler.view.frame.width - 52)
    }
    
    @Test
    func testWidthGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width >= ctrler.view.Width - 52
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.width == ctrler.view.frame.width - 52)
    }
    
    @Test
    func testWidthLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width <= ctrler.view.Width - 52
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.width == 0)
    }
    
    @Test
    func testHeight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height == ctrler.view.Height + 34
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.height == ctrler.view.frame.height + 34)
    }
    
    @Test
    func testHeightReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Height + 34 == v.Height
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.height == ctrler.view.frame.height + 34)
    }
    
    @Test
    func testHeightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height >= ctrler.view.Height - 34
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.height == ctrler.view.frame.height - 34)
    }
    
    @Test
    func testHeightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height <= ctrler.view.Height - 34
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.height == 0)
    }

    // Single Value
    
    @Test
    func testSingleValueTopDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueTopCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueTopInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueTopGreaterOrEqualDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueTopGreaterOrEqualCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueTopGreaterOrEqualInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueLessOrEqualDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueLessOrEqualCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueLessOrEqualInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == 10)
    }
    
    @Test
    func testSingleValueBottom() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testSingleValueBottomGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom >= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testSingleValueBottomLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom <= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.y == ctrler.view.frame.height - 23)
    }
    
    @Test
    func testSingleValueLeft() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left == 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == 72)
    }
    
    @Test
    func testSingleValueLeftGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left >= 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == 72)
    }
    
    @Test
    func testSingleValueLeftLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left <= 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == 72)
    }
    
    @Test
    func testSingleValueRight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right == 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == ctrler.view.frame.width - 13)
    }
    
    @Test
    func testSingleValueRightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right >= 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == ctrler.view.frame.width - 13)
    }
    
    @Test
    func testSingleValueRightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right <= 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.origin.x == ctrler.view.frame.width - 13)
    }
    
    @Test
    func testSingleValueWidth() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width == 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.width == 23)
    }
    
    @Test
    func testSingleValueWidthGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width >= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.width == 23)
    }
    
    @Test
    func testSingleValueWidthLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.centerInContainer() // There is a bug where we need to have a x/y placement for size to be accurate.
        v.Width <= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.width == 0)
    }
    
    @Test
    func testSingleValueHeight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height == 94
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.height == 94)
    }
    
    @Test
    func testSingleValueHeightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height >= 94
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.height == 94)
    }
    
    @Test
    func testSingleValueHeightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.centerInContainer() // There is a bug where we need to have a x/y placement for size to be accurate.
        v.Height <= 94
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(v.frame.height == 0)
    }
    
    @Test
    func testScrollView() {
        let scrollView = UIScrollView()
        let contentView = UIView()
        ctrler.view.subviews {
            scrollView.subviews {
                contentView
            }
        }
        scrollView.fillContainer()
        contentView.Width == ctrler.view.Width
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(contentView.frame.width == ctrler.view.frame.width)
    }
    
    @Test
    func testScrollViewReflexive() {
        let scrollView = UIScrollView()
        let contentView = UIView()
        ctrler.view.subviews {
            scrollView.subviews {
                contentView
            }
        }
        scrollView.fillContainer()
        ctrler.view.Width == contentView.Width
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        #expect(contentView.frame.width == ctrler.view.frame.width)
    }
    
    @Test
    func testDifferentViewHierarchies() {
        // Classic example of a field with a dropdown.
        let box = UIView()
        let field = UIView()
        let dropdown = UIView()
        
        let aView: UIView = ctrler.view
        aView.subviews {
            box.subviews {
                field
            }
            dropdown
        }
        
        box.fillContainer(padding: 60)
        |-field-|.top(1).height(50)//centerVertically()
        
        |dropdown|
        dropdown.Bottom == ctrler.view.Bottom
       

        dropdown.Top == field.Bottom // This line is being tested test out reflexivity

        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        let absoluteFieldBottom = field.frame.origin.y + field.frame.height + box.frame.origin.y
        #expect(absoluteFieldBottom == dropdown.frame.origin.y)
    }
    
    @Test
    func testDifferentViewHierarchiesReflexivity() {
        // Classic example of a field with a dropdown.
        let box = UIView()
        let field = UIView()
        let dropdown = UIView()
        
        let aView: UIView = ctrler.view
        aView.subviews {
            box.subviews {
                field
            }
            dropdown
        }
        
        box.fillContainer(padding: 60)
        |-field-|.top(1).height(50)//centerVertically()
        
        |dropdown|
        dropdown.Bottom == ctrler.view.Bottom
        
        field.Bottom == dropdown.Top // This line is being tested test out reflexivity
        
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        
        let absoluteFieldBottom = field.frame.origin.y + field.frame.height + box.frame.origin.y
        #expect(absoluteFieldBottom == dropdown.frame.origin.y)
    }
}
