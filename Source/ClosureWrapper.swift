//
//  ClosureWrapper.swift
//  Stevia
//
//  Created by Blaz Merela on 28/06/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import Foundation

typealias ActionBlock = (() -> Void)?

class ClosureWrapper {
    var closure: ActionBlock

    init(_ closure: ActionBlock) {
        self.closure = closure
    }
}
