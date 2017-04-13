![Stevia](https://raw.githubusercontent.com/s4cha/Stevia/master/banner.png)

# Stevia

[![Language: Swift2 and 3](https://img.shields.io/badge/language-swift2|swift3-f48041.svg?style=flat)](https://developer.apple.com/swift)
![Platform: iOS 8+](https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://cocoapods.org)
[![Build Status](https://www.bitrise.io/app/4478e29045c5f12e.svg?token=pti6g-HVKBUPv9mIR3baIw&branch=master)](https://www.bitrise.io/app/4478e29045c5f12e)
[![Join the chat at https://gitter.im/s4cha/Stevia](https://badges.gitter.im/s4cha/Stevia.svg)](https://gitter.im/s4cha/Stevia?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License: MIT](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/s4cha/Stevia/blob/master/LICENSE) [![Release version](https://img.shields.io/badge/release-3.0-blue.svg)]()


[Reason](#reason) - [Example](#login-view-example) - [Live Reload](#live-reload) - [Installation](#installation) - [Documentation](#documentation)


### Visual Layout Api
```swift
layout(
    100,
    |-email-| ~ 80,
    8,
    |-password-forgot-| ~ 80,
    >=20,
    |login| ~ 80,
    0
)
```
### Chainable Api
```swift
email.top(100).left(8).right(8).width(200).height(44)
alignHorizontally(password, forgot)
image.fillContainer()
button.centerInContainer().size(50%)
equalWidths(email, password)
image.width(>=80)
```

### Equation-Based Api
```swift
email.Top == 100
password.CenterY == forgot.CenterY
login.Top >= password.Bottom + 20
login.Width == 75 % Width
```

All Generate **native** NSLayoutConstraints 🎉

## Try it!

Stevia is part of [freshOS](http://freshos.org) iOS toolset. Try it in an example App ! <a class="github-button" href="https://github.com/freshOS/StarterProject/archive/master.zip" data-icon="octicon-cloud-download" data-style="mega" aria-label="Download freshOS/StarterProject on GitHub">Download Starter Project</a>

## Reason
### Why
Because **nothing holds more truth than pure code** 🤓  
Xibs and storyboards are **heavy, hard to maintain, hard to merge.**  
They split the view concept into 2 separate files making debugging a **nightmare**    
*There must be a better way*

### How
By creating a tool that makes Auto layout code finally **readable by a human being**.  
By coupling it with live code injection such as *injectionForXcode* we can **design views in real time**  
View layout becomes **fun**, **concise**, **maintainable** and dare I say, *beautiful* ❤️

### What
- [x] Auto Layout DSL
- [x] Pure Swift
- [x] Simple, this is just NSLayoutConstraint shortcuts, pure UIKit code, no voodoo magic
- [x] Chainable api

## Advantages of Stevia
- [x] No more constraints hell in Interface builder.
- [x] No more debugging in Interface builder toggling checkboxes.
- [x] The view code is not split between 2 files anymore
- [x] What you see is what you get, your view code is in one place, there is no hidden logic elsewere (in the xib)
- [x] No more referencing Storyboards or Xibs by their names "ProfileStoryboard". We all know strings are bad identifiers.
- [x] Clear view Hierarchy
- [x] Live reload, WHAT YOU SEE IS WHAT YOU GET
- [x] Events are a breeze
- [x] Code views Faster
- [x] No more XML (Thank God!)
- [x] Better readability 1000lines XML file vs. 30lines code
- [x] Readable constraints (they actually look like the layout itself \o/)
- [x] Horizontal & vertical layout can be described at the same time
- [x] Styles are well separated, concise, reusable and can be composed
- [x] Content like text, placeholders are easier to visualize

## Login View Example
![alt text](https://raw.githubusercontent.com/s4cha/Stevia/master/LoginExample/login.png "Login view")

### Before (Native Autolayout)

```swift
class LoginViewNative:UIView {

    let email = UITextField()
    let password = UITextField()
    let login = UIButton()

    convenience init() {
        self.init(frame:CGRect.zero)
        backgroundColor = .whiteColor()

        addSubview(email)
        addSubview(password)
        addSubview(login)

        email.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        login.translatesAutoresizingMaskIntoConstraints = false

        addConstraint(NSLayoutConstraint(
                item: email,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Left,
                multiplier: 1,
                constant: 8)
        )
        addConstraint(NSLayoutConstraint(
                item: email,
                attribute: .Right,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Right,
                multiplier: 1,
                constant: -8)
        )
        addConstraint(NSLayoutConstraint(
            item: password,
            attribute: .Left,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Left,
                multiplier: 1,
                constant: 8)
        )
        addConstraint(NSLayoutConstraint(
            item: password,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1,
            constant: -8)
        )
        addConstraint(NSLayoutConstraint(
            item: login,
            attribute: .Left,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Left,
            multiplier: 1,
            constant: 0)
        )
        addConstraint(NSLayoutConstraint(
            item: login,
            attribute: .Right,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Right,
            multiplier: 1,
            constant: 0)
        )
        for b in [email, password, login] {
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
            item: email,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1,
            constant: 100)
        )
        addConstraint(NSLayoutConstraint(
            item:email,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: password,
            attribute: .Top,
            multiplier: 1,
            constant: -8)
        )
        addConstraint(NSLayoutConstraint(
            item: login,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1,
            constant: 0)
        )

        email.placeholder = "Email"
        email.borderStyle = .RoundedRect
        email.autocorrectionType = .No
        email.keyboardType = .EmailAddress
        email.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        email.returnKeyType = .Next

        password.placeholder = "Password"
        password.borderStyle = .RoundedRect
        password.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        password.secureTextEntry = true
        password.returnKeyType = .Done

        login.setTitle("Login", forState: .Normal)
        login.backgroundColor = .lightGrayColor()
        login.addTarget(self, action: "loginTapped", forControlEvents: .TouchUpInside)
        login.setTitle(NSLocalizedString("Login", comment: ""), forState: .Normal)
    }

    func loginTapped() {
        //Do something
    }
}
```

### With Stevia 🍃

```swift

class LoginViewStevia:UIView {

    let email = UITextField()
    let password = UITextField()
    let login = UIButton()

    convenience init() {
        self.init(frame:CGRect.zero)
        backgroundColor = .whiteColor()

        sv(
            email.placeholder("Email").style(fieldStyle), //.style(emailFieldStyle),
            password.placeholder("Password").style(fieldStyle).style(passwordFieldStyle),
            login.text("Login").style(buttonStyle).tap(loginTapped)
        )

        layout(
            100,
            |-email-| ~ 80,
            8,
            |-password-| ~ 80,
            "",
            |login| ~ 80,
            0
        )
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

    func buttonStyle(b:UIButton) {
        b.backgroundColor = .lightGrayColor()
    }

    func loginTapped() {
        //Do something
    }
}
```

**Number of lines** From 144 -> 57 **( ~ divided by 2.5)**  
**Number of characters** From 4231 -> 1338 **( ~ divided by 3)**

Write **3 times less code** that is actually **10X more expressive and maintainable** <3

## Live Reload

You can even enable LiveReload during your development phase! 🎉🎉🎉  

Stevia + [InjectionForXcode](http://injectionforxcode.com/) = <3 (WhoNeedsReactNative??) 🚀

![Output sample](http://g.recordit.co/i6kQfTMEpg.gif)

- Download [InjectionForXcode](http://injectionforxcode.johnholdsworth.com/InjectionPluginV6.4.pkg)

- Install it, Launch it and Go to `File>Install Plugins` (cmd+i)

- Restart Xcode and make sure to click `Load bundles` on the popup

In order to support **live reload** with InjectionForXcode, we simply need to tell our ViewController to rebuild a view after an injection occured.

in `viewDidLoad()` add :
```swift
on("INJECTION_BUNDLE_NOTIFICATION") {
    self.view = MyView()
}
```

Currently InjectionForXcode doesn't seem to swizzle `init` methods for some reason. So we have to move our view code in another methods
```swift
convenience init() {
    self.init(frame:CGRect.zero)
    //View code
}
```
Becomes
```swift
convenience init() {
    self.init(frame:CGRect.zero)
    render()
}

func render() {
  //View code
}

```

And Voila :)

Now you can launch the app and modify whatever you want in the `render()` method. simply hit ^= or `Product>Inject source` and you'll see your changes Live ! 🎉🎉🎉


## Installation


### CocoaPods
```swift
pod 'SteviaLayout'
use_frameworks!
```

### Carthage
```swift
github "s4cha/Stevia"
```

- Create a `Cartfile` file at the root of your project folder

- Add `github "s4cha/Stevia"` to your Cartfile

- Run `carthage update`

- Drag and drop `Stevia.framework` from `/Carthage/Build/iOS/` to Linked frameworks and libraries in Xcode (Project>Target>General>Linked frameworks and libraries)

- Add new run script (Project>Target>Build Phases>+> New run script phase) `/usr/local/bin/carthage copy-frameworks`

- Add Input files `$(SRCROOT)/Carthage/Build/iOS/Stevia.framework`

There you go!

### Manual
Copy Stevia source files to your Xcode project

## Documentation

1. [View Hierarchy](https://github.com/freshOS/Stevia/wiki/1.-View-Hierarchy)
2. [Layout](https://github.com/freshOS/Stevia/wiki/2.-Layout)
  1. [Sizing](https://github.com/freshOS/Stevia/wiki/2.-Layout#sizing)
  2. [Centering](https://github.com/freshOS/Stevia/wiki/2.-Layout#centering)
  3. [Filling](https://github.com/freshOS/Stevia/wiki/2.-Layout#filling)
  4. [Aligning](https://github.com/freshOS/Stevia/wiki/2.-Layout#aligning)
  5. [Following another view](https://github.com/freshOS/Stevia/wiki/2.-Layout#following-another-view)
  6. [Horizontal layout](https://github.com/freshOS/Stevia/wiki/2.-Layout#horizontal-layout)
  7. [Vertical layout](https://github.com/freshOS/Stevia/wiki/2.-Layout#vertical-layout)
  8. [Flexible Margins](https://github.com/freshOS/Stevia/wiki/2.-Layout#flexible-margins)
  9. [Percentage-Based Layout](https://github.com/freshOS/Stevia/wiki/2.-Layout#Percentage-Based-Layout)
  10. [Equations](https://github.com/freshOS/Stevia/wiki/2.-Layout#Equations)
  11. [Priorities](https://github.com/freshOS/Stevia/wiki/2.-Layout#priorities)
3. [Styling](https://github.com/freshOS/Stevia/wiki/Styling)
4. [Content](https://github.com/freshOS/Stevia/wiki/4.-Content)
5. [Button taps](https://github.com/freshOS/Stevia/wiki/5.-Button-taps)
6. [Changing constraints](https://github.com/freshOS/Stevia/wiki/6.-Changing-Constraints)
  1. [Simple Changes](https://github.com/freshOS/Stevia/wiki/6.-Changing-Constraints#simple-changes)
  2. [Complex Changes](https://github.com/freshOS/Stevia/wiki/6.-Changing-Constraints#complex-changes)
  3. [Animating Changes](https://github.com/freshOS/Stevia/wiki/6.-Changing-Constraints#animating-changes)
7. [TableView Cells & CollectionView Cells](https://github.com/freshOS/Stevia/wiki/7.-TableView-Cells-&-CollectionView-Cells)
8. [Getting views from the controller](https://github.com/freshOS/Stevia/wiki/8.-Getting-views-from-the-controller)
9. [Complex/Nested layouts](https://github.com/freshOS/Stevia/wiki/9.-Complex-Nested-layouts)
10. [Known issues](https://github.com/freshOS/Stevia/wiki/z10.-Known-issues)


## Rationale behind the project

On the [Yummypets](http://yummypets.com) app, we needed to deal with looooooots of views.  
After trying different methods for building views (Xibs, Storyboards, Splitting Storyboards, React Native even(!).  
We found that coding views programmatically was the best solution for us.
But coding views programmatically had its issues too: UIKit exposes an imperative, verbose API, and it's really easy to create a mess with it.
That's why we created Stevia.


## Contributors

[YannickDot](https://github.com/YannickDot),  [S4cha](https://github.com/S4cha),  [Damien](https://github.com/damien-nd),
[Snowcraft](https://github.com/Snowcraft), [Mathieu-o](https://github.com/Mathieu-o)

## Swift Version
Swift 2 -> version **2.3.0**  
Swift 3 -> version **3.1.3**
