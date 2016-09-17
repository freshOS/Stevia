//
//  ViewController.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() { view = LoginViewStevia() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here we want to reload the view after injection
        // this is only needed for live reload
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.view = LoginViewStevia()
        }
    }
}

