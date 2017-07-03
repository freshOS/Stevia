//
//  Stevia+Editing.swift
//  Stevia
//
//  Created by Blaz Merela on 28/06/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

extension UITextField: AssociatedBlock {}
public extension UITextField {

    public enum Editing {
        case didBegin, changed, didEnd, didEndOnExit
        case allEditingEvents

        fileprivate var controlEvent: UIControlEvents {
            #if swift(>=2.2)
                switch self {
                case .didBegin: return .editingDidBegin
                case .changed: return .editingChanged
                case .didEnd: return .editingDidEnd
                case .didEndOnExit: return .editingDidEndOnExit
                case .allEditingEvents: return .allEditingEvents
                }

            #else
                switch self {
                case .didBegin: return .EditingDidBegin
                case .changed: return .EditingChanged
                case .didEnd: return .EditingDidEnd
                case .didEndOnExit: return .EditingDidEndOnExit
                case .allEditingEvents: return .AllEditingEvents
                }
            #endif
        }
    }

    /** Links UITextField editing event to a block.

     Example Usage:

     ```
     textfield.on(editing: .changed) {
     // do something
     }
     ```

     Or
     ```
     textfield.on(editing: .changed, doSomething)

     // later
     func doSomething() {
     // ...
     }
     ```

     - Returns: Itself for chaining purposes

     */
    @discardableResult
    public func on(editing: Editing, block: @escaping () -> Void) -> UITextField {
        #if swift(>=2.2)
            addTarget(self, action: #selector(edited), for: editing.controlEvent)
        #else
            addTarget(self, action: "edited", forControlEvents: editing.controlEvent)
        #endif
        associatedBlock = block
        return self
    }

    /** */
    @objc
    func edited() {
        associatedBlock?()
    }
}
