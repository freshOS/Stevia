////
////  LoginViewNative.swift
////  LoginStevia
////
////  Created by Sacha Durand Saint Omer on 01/10/15.
////  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
////
//
//import UIKit
//
//class LoginViewNative:UIView {
//    
//    let email = UITextField()
//    let password = UITextField()
//    let login = UIButton()
//    
//    convenience init() {
//        self.init(frame:CGRectZero)
//        backgroundColor = .whiteColor()
//    
//        addSubview(email)
//        addSubview(password)
//        addSubview(login)
//        
//        email.translatesAutoresizingMaskIntoConstraints = false
//        password.translatesAutoresizingMaskIntoConstraints = false
//        login.translatesAutoresizingMaskIntoConstraints = false
//        
//        addConstraint(NSLayoutConstraint(
//                item: email,
//                attribute: .Left,
//                relatedBy: .Equal,
//                toItem: self,
//                attribute: .Left,
//                multiplier: 1,
//                constant: 8)
//        )
//        addConstraint(NSLayoutConstraint(
//                item: email,
//                attribute: .Right,
//                relatedBy: .Equal,
//                toItem: self,
//                attribute: .Right,
//                multiplier: 1,
//                constant: -8)
//        )
//        addConstraint(NSLayoutConstraint(
//            item: password,
//            attribute: .Left,
//                relatedBy: .Equal,
//                toItem: self,
//                attribute: .Left,
//                multiplier: 1,
//                constant: 8)
//        )
//        addConstraint(NSLayoutConstraint(
//            item: password,
//            attribute: .Right,
//            relatedBy: .Equal,
//            toItem: self,
//            attribute: .Right,
//            multiplier: 1,
//            constant: -8)
//        )
//        addConstraint(NSLayoutConstraint(
//            item: login,
//            attribute: .Left,
//            relatedBy: .Equal,
//            toItem: self,
//            attribute: .Left,
//            multiplier: 1,
//            constant: 0)
//        )
//        addConstraint(NSLayoutConstraint(
//            item: login,
//            attribute: .Right,
//            relatedBy: .Equal,
//            toItem: self,
//            attribute: .Right,
//            multiplier: 1,
//            constant: 0)
//        )
//        for b in [email, password, login] {
//            addConstraint(NSLayoutConstraint(
//                item: b,
//                attribute: .Height,
//                relatedBy: .Equal,
//                toItem: nil,
//                attribute: .NotAnAttribute,
//                multiplier: 1,
//                constant: 80)
//            )
//        }
//        addConstraint(NSLayoutConstraint(
//            item: email,
//            attribute: .Top,
//            relatedBy: .Equal,
//            toItem: self,
//            attribute: .Top,
//            multiplier: 1,
//            constant: 100)
//        )
//        addConstraint(NSLayoutConstraint(
//            item:email,
//            attribute: .Bottom,
//            relatedBy: .Equal,
//            toItem: password,
//            attribute: .Top,
//            multiplier: 1,
//            constant: -8)
//        )
//        addConstraint(NSLayoutConstraint(
//            item: login,
//            attribute: .Bottom,
//            relatedBy: .Equal,
//            toItem: self,
//            attribute: .Bottom,
//            multiplier: 1,
//            constant: 0)
//        )
//        
//        email.placeholder = "Email"
//        email.borderStyle = .RoundedRect
//        email.autocorrectionType = .No
//        email.keyboardType = .EmailAddress
//        email.font = UIFont(name: "HelveticaNeue-Light", size: 26)
//        email.returnKeyType = .Next
//        
//        password.placeholder = "Password"
//        password.borderStyle = .RoundedRect
//        password.font = UIFont(name: "HelveticaNeue-Light", size: 26)
//        password.secureTextEntry = true
//        password.returnKeyType = .Done
//        
//        login.setTitle("Login", forState: .Normal)
//        login.backgroundColor = .lightGrayColor()
//        login.addTarget(self, action: "loginTapped", forControlEvents: .TouchUpInside)
//        login.setTitle(NSLocalizedString("Login", comment: ""), forState: .Normal)
//    }
//    
//    func loginTapped() {
//        //Do something
//    }
//}