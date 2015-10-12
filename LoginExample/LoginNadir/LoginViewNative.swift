//
//  LoginViewNative.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

class LoginViewNative:UIView {
    
    let emailField = UITextField()
    let passwordField = UITextField()
    let button = UIButton()
    
    convenience init() {
        self.init(frame:CGRectZero)
        backgroundColor = .whiteColor()
    
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(button)
        
        addConstraint(NSLayoutConstraint(
                item: emailField,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Left,
                multiplier: 1,
                constant: 8)
        )
        addConstraint(NSLayoutConstraint(
                item: emailField,
                attribute: .Right,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Right,
                multiplier: 1,
                constant: 8)
        )
        addConstraint(NSLayoutConstraint(
            item: passwordField,
            attribute: .Left,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Left,
                multiplier: 1,
                constant: 8)
        )
        addConstraint(NSLayoutConstraint(
            item: passwordField,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1,
            constant: 8)
        )
        addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1,
            constant: 0)
        )
        for b in [emailField, passwordField, button] {
            addConstraint(NSLayoutConstraint(
                item: b,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: nil,
                attribute: .NotAnAttribute,
                multiplier: 1,
                constant: 80)
            )
        }
        addConstraint(NSLayoutConstraint(
            item: emailField,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1,
            constant: 100)
        )
        addConstraint(NSLayoutConstraint(
            item:emailField,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: passwordField,
            attribute: .Top,
            multiplier: 1,
            constant: 8)
        )
        addConstraint(NSLayoutConstraint(
            item: button,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0)
        )
        
        emailField.placeholder = "Email"
        emailField.borderStyle = .RoundedRect
        emailField.autocorrectionType = .No
        emailField.keyboardType = .EmailAddress
        emailField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        emailField.returnKeyType = .Next
        
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .RoundedRect
        passwordField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        passwordField.secureTextEntry = true
        passwordField.returnKeyType = .Done
        
        button.setTitle("Login", forState: .Normal)
        button.backgroundColor = .lightGrayColor()
        
        button.addTarget(self, action: "loginTapped", forControlEvents: .TouchUpInside)
        
        button.setTitle(NSLocalizedString("Login", comment: ""), forState: .Normal)
    }
    
    func loginTapped() {
        //Do something
    }
}