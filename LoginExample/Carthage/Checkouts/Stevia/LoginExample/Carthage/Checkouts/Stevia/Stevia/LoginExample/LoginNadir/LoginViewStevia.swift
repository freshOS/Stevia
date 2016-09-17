//
//  LoginViewStevia.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit
import Stevia

class LoginViewStevia:UIView {
    
    let email = UITextField()
    let password = UITextField()
    let login = UIButton()
    
    convenience init() {
        self.init(frame:CGRectZero)
        // This is only needed for live reload as injectionForXcode
        // doesn't swizzle init methods.
        render()
    }
    
    func render() {
        backgroundColor = .grayColor()

        sv([
            email.placeholder("Email").style(fieldStyle), //.style(emailFieldStyle),
            password.placeholder("Password").style(fieldStyle).style(passwordFieldStyle),
            login.text("Login").style(buttonSytle).tap(loginTapped)
        ])
        
        layout([
            100,
            |-email-| ~ 80,
            8,
            |-password-| ~ 80,
            "",
            |login| ~ 80,
            0
        ])
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


// Chainable syntax
//        emailField.fillH(m: 8)
//        passwordField.fillH(m: 8)
//        button.fillH()
//        for b in [emailField, passwordField, button] { b.height(80)}
//        emailField.top(100).stackV(m: 8, v: passwordField)
//        button.bottom(0)

// Visual format
//        views = [ "emailField" :emailField, "passwordField" : passwordField, "button" : button ]
//        h("|-[emailField]-|")
//        h("|-[passwordField]-|")
//        h("|[button]|")
//        v("|-100-[emailField(80)]-[passwordField(80)]-(>=8)-[button(80)]|")
