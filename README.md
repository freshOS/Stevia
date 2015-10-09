# Nadir
Nadir is a lightweight helper aiming to make coding auto layout views a breeze

## Constraints

### Turn this

```swift
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

```

### Into

```swift
layout([
    100,
    |-emailField-|      ~ 80,
    8,
    |-passwordField-|   ~ 80,
    "",
    |button|            ~ 80,
    0
])
```

## Hierarchy

### This
```swift
addSubview(emailField)
addSubview(passwordField)
addSubview(button)
```

### Into
```swift
sv([
    emailField,
    passwordField,
    button
])
```
## Styling
### This
```swift
emailField.borderStyle = .RoundedRect
emailField.autocorrectionType = .No
emailField.keyboardType = .EmailAddress
emailField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
emailField.returnKeyType = .Next
```

### Into
```swift
emailField.style { f in
    f.borderStyle = .RoundedRect
    f.autocorrectionType = .No
    f.keyboardType = .EmailAddress
    f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
    f.returnKeyType = .Next
}
```

## Events
### This
```swift
button.addTarget(self, action: "loginTapped", forControlEvents: .TouchUpInside)
```

### Into
```swift
 button.tap(loginTapped)
```



## Real life example : a classic Login View
![alt text](https://raw.githubusercontent.com/s4cha/Nadir/master/login.png "Login view")


### Before Nadir

```swift

class LoginView:UIView {

    let emailField = UITextField()
    let passwordField = UITextField()
    let button = UIButton()

    convenience init() {
        self.init(frame:CGRectZero)
        backgroundColor = .whiteColor()

        addSubview(emailField)
        addSubview(passwordField)
        addSubview(button)

        addConstraint(NSLayoutConstraint(item: emailField, attribute: .Left, relatedBy: .Equal,toItem: self, attribute: .Left, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: emailField, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: passwordField, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: passwordField, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 0))
        for b in [emailField, passwordField, button] {
            addConstraint(NSLayoutConstraint(item: b, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 80))
        }
        addConstraint(NSLayoutConstraint(item: emailField, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 100))
        addConstraint(NSLayoutConstraint(item: emailField, attribute: .Bottom, relatedBy: .Equal, toItem: passwordField, attribute: .Top, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: button, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0))

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
    }

    func loginTapped() {
    //Do something
    }
}
```

### Nadir: On

```swift

class LoginView:UIView {

    let emailField = UITextField()
    let passwordField = UITextField()
    let name = UITextField()
    let button = UIButton()

    convenience init() {
        self.init(frame:CGRectZero)
        backgroundColor = .whiteColor()

        sv([
            emailField.placeholder("Email").style(fieldStyle).style(emailFieldStyle),
            passwordField.placeholder("Password").style(fieldStyle).style(passwordFieldStyle),
            button.text("Login").tap(loginTapped).style(buttonSytle)
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
    }

    func fieldStyle(f:UITextField) {
        f.borderStyle = .RoundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.returnKeyType = .Next
    }

    func emailFieldStyle(f:UITextField) {
        f.autocorrectionType = .No
        f.keyboardType = .EmailAddress
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

```

### Advantages of Nadir over classic Way

Not a lot less lines (40ish) but the number of total characters is halved!

- The view hierachy is clearer
- Constraints are (WAY) more readable, they actually look like the layout itself \o/
- Styles are well separated, concise, reusable and can be composed
- Content like text, placeholders are easier to visualize
- Events are a breeze

Less code + More readable == easier to maintain


Rationale behind the project
--

Easy or simple ?
--
We know some things can look "easy" but be very complex under the hood.
We tried to keep both.
We wanted Nadir to be easy to use while remaining very simple.
Most of Nadir's code is just simple shortcuts to UIKit Api.
Nothing prevents you from mixing Nadir with pure UIKit code.
Because Nadir IS pur UIKit code.

Why Nadir?
---

At [Yummypets](http://yummypets.com) we have loooots of views.

After trying diferent methods for building views (Xibs, Storyboard, Splitting Storyboards) React Native even!
We found that coding views programatically was the best solution.

Why ? Because CODE DON'T LIE

But coding views programatically had its issues too.
That's why we created Nadir.





Advantages of UIView swift class over Xibs or storyboards
--

- No more XML (Thank God!)
- No more constraints hell in Interface builder.
- No more debugging in Interface builder toggling checkboxes.
- The view Code is not split between 2 files anymore
- What you see is what you get, your view code is in one place, there is no hidden logic elsewere (in the xib)
- No more refrencing Storyboards or Xibs by their names "ProfileStoryboard". We all know strings are bad identifiers.
- More consise ex: 1000lines XMl file vs. 30lines code

Next
---
- Live reload
- Documenting Nadir shortcuts

Contributors
---
[YannickDot](https://github.com/YannickDot),  [S4cha](https://github.com/S4cha),  [Damien](https://github.com/damien-nd)
