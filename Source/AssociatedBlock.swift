//
//  AssociatedBlock.swift
//  Stevia
//
//  Created by Blaz Merela on 28/06/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

protocol AssociatedBlock: class {
    var associatedBlock: ActionBlock { get set }
}

private var kAssociatedBlockKey = 0
extension AssociatedBlock where Self: UIControl {
    var associatedBlock: ActionBlock {
        get {
            if let cw = objc_getAssociatedObject(self,
                                                 &kAssociatedBlockKey) as? ClosureWrapper {
                return cw.closure
            }
            return nil
        }
        set {
            objc_setAssociatedObject(self,
                                     &kAssociatedBlockKey,
                                     ClosureWrapper(newValue),
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

typealias ActionBlock = (() -> Void)?

private class ClosureWrapper {
    var closure: ActionBlock

    init(_ closure: ActionBlock) {
        self.closure = closure
    }
}
