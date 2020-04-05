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

    func testLegacySv() {
        let view = UIView()
        let v1 = UIView()
        let v2 = UIView()
        view.sv(
            v1,
            v2
        )
        XCTAssertEqual(view.subviews.count, 2)
        XCTAssertTrue(view.subviews.contains(v1))
        XCTAssertTrue(view.subviews.contains(v2))
        XCTAssertFalse(v1.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v2.translatesAutoresizingMaskIntoConstraints)
    }

    func testLegacyTableViewCellSV() {
        let cell = UITableViewCell()
        let v1 = UIView()
        let v2 = UIView()
        cell.sv(
            v1,
            v2
        )
        XCTAssertEqual(cell.contentView.subviews.count, 2)
        XCTAssertTrue(cell.contentView.subviews.contains(v1))
        XCTAssertTrue(cell.contentView.subviews.contains(v2))
        XCTAssertFalse(v1.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v2.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testLegacyCollectionViewCellSV() {
        let cell = UICollectionViewCell()
        let v1 = UIView()
        let v2 = UIView()
        cell.sv(
            v1,
            v2
            )
        XCTAssertEqual(cell.contentView.subviews.count, 2)
        XCTAssertTrue(cell.contentView.subviews.contains(v1))
        XCTAssertTrue(cell.contentView.subviews.contains(v2))
        XCTAssertFalse(v1.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v2.translatesAutoresizingMaskIntoConstraints)
    }
    
    // Function Builders version
    
    func testSubviews() {
        let view = UIView()
        let v1 = UIView()
        let v2 = UIView()
        view.subviews {
            v1
            v2
        }
        XCTAssertEqual(view.subviews.count, 2)
        XCTAssertTrue(view.subviews.contains(v1))
        XCTAssertTrue(view.subviews.contains(v2))
        XCTAssertFalse(v1.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v2.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testTableViewCellSubviews() {
        let cell = UITableViewCell()
        let v1 = UIView()
        let v2 = UIView()
        cell.subviews {
            v1
            v2
        }
            
        
        XCTAssertEqual(cell.contentView.subviews.count, 2)
        XCTAssertTrue(cell.contentView.subviews.contains(v1))
        XCTAssertTrue(cell.contentView.subviews.contains(v2))
        XCTAssertFalse(v1.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v2.translatesAutoresizingMaskIntoConstraints)
    }

    func testCollectionViewCellSubviews() {
        let cell = UICollectionViewCell()
        let v1 = UIView()
        let v2 = UIView()
        cell.subviews {
            v1
            v2
        }
        XCTAssertEqual(cell.contentView.subviews.count, 2)
        XCTAssertTrue(cell.contentView.subviews.contains(v1))
        XCTAssertTrue(cell.contentView.subviews.contains(v2))
        XCTAssertFalse(v1.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v2.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testSubviewsCanBeNested() {
        let view = UIView()
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        let v4 = UIView()
        view.subviews {
            v1.subviews {
                v3
                v4
            }
            v2
        }
        XCTAssertEqual(view.subviews.count, 2)
        XCTAssertTrue(view.subviews.contains(v1))
        XCTAssertTrue(view.subviews.contains(v2))
        XCTAssertEqual(v1.subviews.count, 2)
        XCTAssertTrue(v1.subviews.contains(v3))
        XCTAssertTrue(v1.subviews.contains(v4))
        
        XCTAssertFalse(v1.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v2.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v3.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(v4.translatesAutoresizingMaskIntoConstraints)
    }
}
