//
//  Stevia+Notifications.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 12/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension NSObject {
    
    func on(_ event: String, _ callback:@escaping () -> Void) {
        _ = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: event),
                                                                object: nil,
                                                                queue: nil) { _ in
            callback()
        }
    }
}
#endif
