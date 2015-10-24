//
//  Stevia+Notifications.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 12/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit


extension NSObject {
    
    func on(event:String, _ callback:()->Void) {
        NSNotificationCenter.defaultCenter().addObserverForName(event, object: nil, queue: nil) { _ in
            callback()
        }
    }

}