//
//  LoginViewStevia.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

class LoginViewStevia:UIView {
    
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
