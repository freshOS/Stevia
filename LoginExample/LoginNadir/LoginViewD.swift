
//
//  LoginViewD.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

class LoginViewD:UIView {
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let name = UITextField()
    let button = UIButton()
    
    convenience init() {
        self.init(frame:CGRectZero)
        backgroundColor = .whiteColor()

        
        sv([
            emailField.placeholder("Email").style(fieldStyle), //.style(emailFieldStyle),
            passwordField.placeholder("Password").style(fieldStyle).style(passwordFieldStyle),
            button.text("Login").style(buttonSytle).tap(loginTapped)
        ])
        
        layout([
            100,
            |-emailField-|      ~ 80,
            8,
            |-passwordField-|   ~ 80,
            "",
            |button|            ~ 80,
            0
        ])
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refresh", name: UIApplicationDidBecomeActiveNotification, object: nil)
        
    
        on(UIApplicationDidBecomeActiveNotification, refresh)
    }
    
    func refresh() {
        
    }

    func fieldStyle(f:UITextField) {
        f.borderStyle = .RoundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.returnKeyType = .Next
    }
    
    func passwordFieldStyle(f:UITextField) {
        f.secureTextEntry = true
        f.returnKeyType = .Done
    }
    
    func buttonSytle(b:UIButton) {
        b.backgroundColor = .lightGrayColor()
    }
    
    func loginTapped() {
        //Do something
    }
}

// | shot for self?? humm <3

// | for sides, - for intermargins

//  "|-30-[emailField]-30-[passwordField]-[button]|"  // v| ==0 in container

//  |-30-emailField-30-passwordField-button|

//  |30-emailField-30-passwordField-button|

// todo <= >=



//        |emailField-50-passwordField|

//                3|emailField-passwordField|
//    OR   |-3-emailField-passwordField|
// OR |3-emailField-passwordField|

//        emailField-20

//