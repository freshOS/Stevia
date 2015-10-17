![Stevia logo](https://raw.githubusercontent.com/s4cha/Stevia/master/stevia.png "Stevia logo")

Stevia is an iOS Auto Layout DSL written in swift.

It's not another heavy layout engine, it is just fine set of shortcuts and extensions for creating AutoLayout constraints and defining views using code ! 😍

## Features
- [x] Layout
- [x] Component styling
- [x] Event handling



#### Advantages of Stevia over the classic way

- [x] A clearer view hierachy
- [x] Readable constraints (they actually look like the layout itself \o/)
- [x] Horizontal & vertical layout can be described at the same time
- [x] Styles are well separated, concise, reusable and can be composed
- [x] Content like text, placeholders are easier to visualize
- [x] Events are a breeze

Less code + More readable ==> easier to maintain


## Teaser ... ❤️

#### Layout

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

#### Taps handling

```swift
button.tap(loginTapped)
```

#### Localized text

```swift
button.textKey("Login")
```


#### Notifications

```swift
on(UIApplicationDidBecomeActiveNotification, refresh)
```



## Show me the code!

### Turn this legacy code ...
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
        relatedBy: .Equal

    // [...] (80+ more lines ...)
    //
    // CENSORED.
    // We decided to strip that part because it was WAAYY TO LONG ... 🙉🙈🙊

```

### ... into this !

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


### Maybe you prefer Visual Format ?

```swift
let views = ["emailField":emailField, "passwordField":passwordField]
addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
  "V:|-[emailField]-|",
  options: NSLayoutFormatOptions(rawValue: 0),
  metrics: nil,
  views: views)
)
```

### we got your back 😘
```swift
views = ["emailField":emailField, "passwordField":passwordField]
v("|-[emailField]-|")
```

### But what about using this instead !? Much better ❤️
```swift
|-emailField-|
```

We personally try to avoid visual format because it's more error prone.
Plus the compiler has got you covered with this one :)

## Getting started

### Manual
Copy Stevia source files to your XCode project

### Carthage
```
github "s4cha/Stevia"
```

## Components hierarchy

### This ...
```swift
addSubview(emailField)
addSubview(passwordField)
addSubview(button)
```

### into this !
```swift
sv([
    emailField,
    passwordField,
    button
])
```

## Styling elements
### This ...
```swift
emailField.borderStyle = .RoundedRect
emailField.autocorrectionType = .No
emailField.keyboardType = .EmailAddress
emailField.font = UIFont(name: "HelveticaNeue-Light", size: 26)
emailField.returnKeyType = .Next
```

### into this !
```swift
emailField.style { f in
    f.borderStyle = .RoundedRect
    f.autocorrectionType = .No
    f.keyboardType = .EmailAddress
    f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
    f.returnKeyType = .Next
}
```

## Events handling
### This
```swift
button.addTarget(self, action: "loginTapped", forControlEvents: .TouchUpInside)
```

### Into this !
```swift
 button.tap(loginTapped)
```



## Real life example : a classic Login View
![alt text](https://raw.githubusercontent.com/s4cha/Stevia/master/examples/LoginExample/login.png "Login view")


#### Before Stevia

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

### Stevia Enabled

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




Rationale behind the project
--

Easy or simple ?
--
We know some things can look "easy" but be very complex under the hood.
We tried to keep both.
We wanted Stevia to be easy to use while remaining very simple.
Most of Stevia's code is just simple shortcuts to UIKit API.
Nothing prevents you from mixing Stevia with pure UIKit code.
Because Stevia **IS** pure UIKit code.

Why Stevia?
---

On the [Yummypets](http://yummypets.com) app, we needed to deals with looooooots of views.

After trying different methods for building views (Xibs, Storyboards, Splitting Storyboards, React Native even(!), we found that coding views programmatically was the best solution for us.

Why ? **Because CODE DOESN'T LIE**

But coding views programmatically had its issues too : UIKit exposes an imperative verbose API, and it's really easy to create a mess with it.

That's why we created Stevia.



### Advantages of UIView swift class over Xibs or storyboards

- [x] Better readability ex: 1000lines XML file vs. 30lines code
- [x] No more XML (Thank God!)
- [x] No more constraints hell in Interface builder.
- [x] No more debugging in Interface builder toggling checkboxes.
- [x] The view code is not split between 2 files anymore
- [x] What you see is what you get, your view code is in one place, there is no hidden logic elsewere (in the xib)
- [x] No more referencing Storyboards or Xibs by their names "ProfileStoryboard". We all know strings are bad identifiers.

## Live Reload

You can even enable LiveReload during your development phase! 🎉🎉🎉  

Stevia + [InjectionForXCode](http://injectionforxcode.com/) = <3 (WhoNeedsReactNative??) 🚀

![Output sample](http://g.recordit.co/i6kQfTMEpg.gif)

In order to support live reload with InjectionForXCode, we simply need to tell our ViewController to rebuild a view after an injection occured.

```swift
on("INJECTION_BUNDLE_NOTIFICATION") {
    self.v = CodeRequestView()
    self.view = self.v
}
```

Currently InjectionForXcode doesn't seem to swizzle "init" methods for some reason. So we have to move our view code in another methods
```swift
convenience init() {
    self.init(frame:CGRectZero)
    //View code
}
```
Becomes
```swift
convenience init() {
    self.init(frame:CGRectZero)
    render()
}

func render() {
  //View code
}

```

And Voila :)


## Next steps
- Add Carthage Framework support
- Table of contents
- Api reference
- Getting started
- Documenting Stevia shortcuts
- Documenting chainable api


## Contributors

[YannickDot](https://github.com/YannickDot),  [S4cha](https://github.com/S4cha),  [Damien](https://github.com/damien-nd),
[Snowcraft](https://github.com/Snowcraft)
