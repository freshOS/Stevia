//: Playground - noun: a place where people can play
import UIKit
import XCPlayground
import Stevia

// Open the Workspace and
// play around with the constraints! 

class LoginViewStevia:UIView {
    
    let email = UITextField()
    let password = UITextField()
    let login = UIButton()
    
    let forgot = UILabel()
    
    convenience init() {
        self.init(frame:CGRectZero)
        backgroundColor = .darkGrayColor()
        
        sv([
            email.placeholder("Email").style(fieldStyle),
            password.placeholder("Password").style(fieldStyle).style(passwordFieldStyle),
            login.text("Login").style(buttonSytle).tap(loginTapped),
            forgot.text("Forgot ?")
        ])
        
        layout([
            100,
            |-email-| ~ 80,
            8,
            |-password-forgot-| ~ 80,
            "",
            |login|,// ~ 80,
            0
        ])
        
        password.setContentHuggingPriority(0, forAxis: .Horizontal)
        
        forgot.backgroundColor = .redColor()
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

let v = LoginViewStevia()
v.frame = CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0)
XCPlaygroundPage.currentPage.liveView = v

