//
//  EquationTests.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 27/01/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import XCTest
import Stevia

class EquationTests: XCTestCase {
    
    var win: UIWindow!
    var ctrler: UIViewController!
    
    override func setUp() {
        super.setUp()
        win = UIWindow(frame: UIScreen.main.bounds)
        ctrler =  UIViewController()
        win.rootViewController = ctrler
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTopDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == ctrler.view.Top + Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testTopCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == ctrler.view.Top + CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testTopInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == ctrler.view.Top + Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testTopReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Top + 10 == v.Top
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testTopGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= ctrler.view.Top + 10
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testTopLessThanOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= ctrler.view.Top + 10
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testBottomDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == ctrler.view.Bottom - Double(23)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testBottomCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == ctrler.view.Bottom - CGFloat(23)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testBottomInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == ctrler.view.Bottom - Int(23)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testBottomReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Bottom - 23 == v.Bottom
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testBottomGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom >= ctrler.view.Bottom - 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testBottomLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom <= ctrler.view.Bottom - 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testLeft() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left == ctrler.view.Left + 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testLeftReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Left + 72 == v.Left
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testLeftGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left >= ctrler.view.Left + 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testLeftLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left <= ctrler.view.Left + 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testRight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right == ctrler.view.Right - 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testRightReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Right - 13 == v.Right
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testRightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right >= ctrler.view.Right - 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testRightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right >= ctrler.view.Right - 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testWidth() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width == ctrler.view.Width - 52
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, ctrler.view.frame.width - 52)
    }
    
    func testWidthReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Width - 52 == v.Width
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, ctrler.view.frame.width - 52)
    }
    
    func testWidthGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width >= ctrler.view.Width - 52
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, ctrler.view.frame.width - 52)
    }
    
    func testWidthLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width <= ctrler.view.Width - 52
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, 0)
    }
    
    func testHeight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height == ctrler.view.Height + 34
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height + 34)
    }
    
    func testHeightReflexive() {
        let v = UIView()
        ctrler.view.subviews { v }
        ctrler.view.Height + 34 == v.Height
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height + 34)
    }
    
    func testHeightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height >= ctrler.view.Height - 34
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, ctrler.view.frame.height - 34)
    }
    
    func testHeightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height <= ctrler.view.Height - 34
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, 0)
    }

    // Single Value
    
    func testSingleValueTopDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueTopCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueTopInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top == Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueTopGreaterOrEqualDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueTopGreaterOrEqualCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueTopGreaterOrEqualInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top >= Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueLessOrEqualDouble() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= Double(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueLessOrEqualCGFloat() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= CGFloat(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueLessOrEqualInt() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Top <= Int(10)
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, 10)
    }
    
    func testSingleValueBottom() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom == 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testSingleValueBottomGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom >= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testSingleValueBottomLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Bottom <= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.y, ctrler.view.frame.height - 23)
    }
    
    func testSingleValueLeft() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left == 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testSingleValueLeftGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left >= 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testSingleValueLeftLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Left <= 72
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, 72)
    }
    
    func testSingleValueRight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right == 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testSingleValueRightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right >= 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testSingleValueRightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Right <= 13
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.origin.x, ctrler.view.frame.width - 13)
    }
    
    func testSingleValueWidth() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width == 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, 23)
    }
    
    func testSingleValueWidthGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Width >= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, 23)
    }
    
    func testSingleValueWidthLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.centerInContainer() // There is a bug where we need to have a x/y placement for size to be accurate.
        v.Width <= 23
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.width, 0)
    }
    
    func testSingleValueHeight() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height == 94
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, 94)
    }
    
    func testSingleValueHeightGreaterOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.Height >= 94
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, 94)
    }
    
    func testSingleValueHeightLessOrEqual() {
        let v = UIView()
        ctrler.view.subviews { v }
        v.centerInContainer() // There is a bug where we need to have a x/y placement for size to be accurate.
        v.Height <= 94
        ctrler.view.layoutIfNeeded() // This is needed to force auto-layout to kick-in
        XCTAssertEqual(v.frame.height, 0)
    }
    
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
        XCTAssertEqual(contentView.frame.width, ctrler.view.frame.width)
    }
    
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
        XCTAssertEqual(contentView.frame.width, ctrler.view.frame.width)
    }
    
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
        XCTAssertEqual(absoluteFieldBottom, dropdown.frame.origin.y)
    }
    
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
        XCTAssertEqual(absoluteFieldBottom, dropdown.frame.origin.y)
    }
}
