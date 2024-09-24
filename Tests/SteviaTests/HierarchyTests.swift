//
//  HierarchyTests.swift
//  Stevia
//
//  Created by Naabed on 12/02/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import Testing
import UIKit
import Stevia

@Suite
@MainActor
struct HierarchyTests {
    
    @Test
    func subviews() {
        let view = UIView()
        let v1 = UIView()
        let v2 = UIView()
        view.subviews {
            v1
            v2
        }
        #expect(view.subviews.count == 2)
        #expect(view.subviews.contains(v1))
        #expect(view.subviews.contains(v2))
        #expect(v1.translatesAutoresizingMaskIntoConstraints == false)
        #expect(v2.translatesAutoresizingMaskIntoConstraints == false)
    }
    
    @Test
    func tableViewCellSubviews() {
        let cell = UITableViewCell()
        let v1 = UIView()
        let v2 = UIView()
        cell.subviews {
            v1
            v2
        }
            
        #expect(cell.contentView.subviews.count ==  2)
        #expect(cell.contentView.subviews.contains(v1))
        #expect(cell.contentView.subviews.contains(v2))
        #expect(v1.translatesAutoresizingMaskIntoConstraints == false)
        #expect(v2.translatesAutoresizingMaskIntoConstraints == false)
    }

    @Test
    func testCollectionViewCellSubviews() {
        let cell = UICollectionViewCell()
        let v1 = UIView()
        let v2 = UIView()
        cell.subviews {
            v1
            v2
        }
        #expect(cell.contentView.subviews.count == 2)
        #expect(cell.contentView.subviews.contains(v1))
        #expect(cell.contentView.subviews.contains(v2))
        #expect(v1.translatesAutoresizingMaskIntoConstraints == false)
        #expect(v2.translatesAutoresizingMaskIntoConstraints == false)
    }
   
    @Test
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
        #expect(view.subviews.count == 2)
        #expect(view.subviews.contains(v1))
        #expect(view.subviews.contains(v2))
        #expect(v1.subviews.count == 2)
        #expect(v1.subviews.contains(v3))
        #expect(v1.subviews.contains(v4))
        
        #expect(v1.translatesAutoresizingMaskIntoConstraints == false)
        #expect(v2.translatesAutoresizingMaskIntoConstraints == false)
        #expect(v3.translatesAutoresizingMaskIntoConstraints == false)
        #expect(v4.translatesAutoresizingMaskIntoConstraints == false)
    }
}
