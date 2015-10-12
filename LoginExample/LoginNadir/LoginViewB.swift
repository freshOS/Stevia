//
//  LoginView.swift
//  LoginNadir
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

class LoginViewB:UIView {
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let button = UIButton()
    
    convenience init() {
        self.init(frame:CGRectZero)
        backgroundColor = .whiteColor()
        
        sv([
            emailField.placeholder("Email").style(emailFieldStyle),
            passwordField.placeholder("Password").style(passwordFieldStyle),
            button.text("Login").style(buttonSytle)
        ])
        
        views = [ "emailField" :emailField, "passwordField" : passwordField, "button" : button ]
        h("|-[emailField]-|")
        h("|-[passwordField]-|")
        h("|[button]|")
        v("|-100-[emailField(80)]-[passwordField(80)]-(>=8)-[button(80)]|")
    }
    
    func emailFieldStyle(f:UITextField) {
        f.borderStyle = .RoundedRect
        f.autocorrectionType = .No
        f.keyboardType = .EmailAddress
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.returnKeyType = .Next
    }
    
    func passwordFieldStyle(f:UITextField) {
        f.borderStyle = .RoundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.secureTextEntry = true
        f.returnKeyType = .Done
    }
    
    func buttonSytle(b:UIButton) {
        b.backgroundColor = .lightGrayColor()
    }
}

