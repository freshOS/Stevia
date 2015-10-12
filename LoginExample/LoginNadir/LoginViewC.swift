//
//  LoginViewC.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

class LoginViewC:UIView {
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let button = UIButton()
    
    convenience init() {
        self.init(frame:CGRectZero)
        
        sv([
            emailField,
            passwordField,
            button
        ])
        
        emailField.fillH(m: 8)
        passwordField.fillH(m: 8)
        button.fillH()
        for b in [emailField, passwordField, button] { b.height(80)}
        emailField.top(100).stackV(m: 8, v: passwordField)
        button.bottom(0)
        
        backgroundColor = .whiteColor()
        emailField.style { f in
            f.placeholder = "Email"
            f.borderStyle = UITextBorderStyle.RoundedRect
            f.autocorrectionType = .No
            f.keyboardType = UIKeyboardType.EmailAddress
            f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
            f.returnKeyType = .Next
        }
        passwordField.style { f in
            f.placeholder = "Password"
            f.borderStyle = UITextBorderStyle.RoundedRect
            f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
            f.secureTextEntry = true
            f.returnKeyType = .Done
        }
        button.style { b in
            b.backgroundColor = .lightGrayColor()
        }
        button.setTitle("Login", forState: .Normal)
    }
}