# Stevia 🍃 -  *Human readable Auto Layout*

[![Language: Swift 2](https://img.shields.io/badge/language-swift2-f48041.svg?style=flat)](https://developer.apple.com/swift)
![Platform: iOS 8+](https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://cocoapods.org)
[![Build Status](https://www.bitrise.io/app/4478e29045c5f12e.svg?token=pti6g-HVKBUPv9mIR3baIw&branch=master)](https://www.bitrise.io/app/4478e29045c5f12e)
[![Join the chat at https://gitter.im/s4cha/Stevia](https://badges.gitter.im/s4cha/Stevia.svg)](https://gitter.im/s4cha/Stevia?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License: MIT](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/s4cha/Stevia/blob/master/LICENSE) [![Release version](https://img.shields.io/badge/release-2.1-blue.svg)]()


[Reason](#reason) - [Example](#login-view-example) - [Live Reload](#live-reload) - [Installation](#installation) - [Documentation](#documentation)



```swift
layout(
    100,
    |-email-| ~ 80,
    8,
    |-password-| ~ 80,
    "",
    |login| ~ 80,
    0
)
```

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

###






## Login View Example
![alt text](https://raw.githubusercontent.com/s4cha/Stevia/master/Stevia/LoginExample/login.png "Login view")

#### Before (Native Autolayout)

```swift
class LoginViewNative:UIView {

    let email = UITextField()
    let password = UITextField()
    let login = UIButton()

    convenience init() {
        self.init(frame:CGRectZero)
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
        self.init(frame:CGRectZero)
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

### View Hierarchy
```swift
sv(
    subview1,
    subview2,
    subview3
)
```
`sv([])` and `sv()` are essentially shortcuts that call `addSubview()` and  
`view.translatesAutoresizingMaskIntoConstraints = false`

It also has the benefit of being **very visual** so that your can actually **see** what the view hierarchy is.
This is especially true for nested hierarchies :

```swift
sv(
    subview1,
    subview2.sv(
        nestedView1,
        nestedView2̨
    ),
    subview3
)
```

### Horizontal layout
This is intended to look like **Apple's visual format**, so you should be very familiar with the syntax.  
Stevia only removes the `[]` and the String.

Stick a label to the left of the screen
```swift
|label
```

With the default margin (8)
```swift
|-label
```

With a custom margin
```swift
|-42-label
```

Just to be very clear we want to **emphasize** that this is **pure syntactic sugar**.  
This equivalent of the following using the chainable api :

```swift
label.left(42)
```
Which in turn will create **Native Autolayout constraints** :
```swift
label.superview?.addConstraint(
  NSLayoutConstraint(
    item: label,
    attribute:.Left,
    relatedBy: .Equal,
    toItem: label.superview!,
    attribute:.Left,
    multiplier: 1,
    constant: 42
  )
)
```

Combine all at once.

```swift
|-avatar-15-name-20-followButton-|
```

### Vertical layout

```swift
avatar.top(50)
```
==
```swift
layout(
    50,
    avatar
  )
```

While using `layout` for a single element might seem a bit overkill, it really **shines** when **combined with horizontal layout.**  
Then we have the full **layout in one place** (hence the name).

```swift
layout(
    50,
    |-15-avatar.size(60)
  )
```
*The avatar is 50px from the top with a left margin of 15px and a size of 60px*

Another great example is the login view, representable in **one** single statement !

```swift
layout(
    100,
    |-email-| ~ 80,
    8,
    |-password-| ~ 80,
    "",
    |login| ~ 80,
    0
)
```

In case you wonder `~` operator == `.height(x)`, it's just more readable in a layout statement that way.

## Chainable Api


The avatar example above could've been written that way using the chainable api :
```swift
avatar.top(50).left(15).size(50)
```

Using `layout` is just clearer in most of the cases but it's yours to choose which way you prefer :)

### Centering

Horizontally
```swift
imageView.centerHorizontally()
```

Vertically
```swift
imageView.centerVertically()
```

On both axis
```swift
imageView.centerInContainer()
```


### Alignment

Horizontally
```swift
alignHorizontally(avatar,name,followButton)
```

Vertically
```swift
alignVertically(title,subtitle,text)
```

Align the center of one view with another one :
```swift
alignCenter(view1, with: view2)
```


In the example above of a follow Cell, here is how the layout code would look like :
```swift
|-avatar-15-name-20-followButton-|
alignHorizontally(avatar,name,followButton)
```
But `|-avatar-15-name-20-followButton-|` actually **returns the array of views!!!** so we can write it in one **single** statement :

```swift
alignHorizontally(|-avatar-15-name-20-followButton-|)
```
🎉🎉🎉

### Button taps

```swift
button.addTarget(self, action: "follow", forControlEvents: .TouchUpInside)
```

Becomes:

```swift
button.tap(follow)
```

This is **shorter** and **less error-prone** since `follow` is is not referenced by a string value anymore \o/

### Styles

Well, just call `style` on a UIView subclass :  

**In-line** for small or unique styles

```swift
detail.style { l in
  l.numberOfLines = 0
  l.textAlignment = .Center
  l.textColor = .blueColor()
  l.text = NSLocalizedString("NeedPetMessage", comment: "")
}
```

Or in a separate to make them reusable

```swift
// My style method, kinda like CSS
func detailStyle(l:UILabel) {
  l.numberOfLines = 0
  l.textAlignment = .Center
  l.textColor = .blueColor()
  l.text = NSLocalizedString("NeedPetMessage", comment: "")
}

// Later
{
  // Set my style
  detail.style(detailStyle)
}
```

This is the **preferred** way because the styles become **reusable** and **composable**: you can chain them!
You can even create a Style File grouping high level functions for common styles.
Usage then becomes very similar to CSS!


### Content

```swift
button.setTitle("Hello", forState: .Normal)
```
Becomes :

```swift
button.text("Hello")
```


```swift
button.setImage(UIImage(named:"CommentIcon"), forState: .Normal)
```
Becomes :

```swift
button.image("CommentIcon")
```



## Rationale behind the project

On the [Yummypets](http://yummypets.com) app, we needed to deal with looooooots of views.  
After trying different methods for building views (Xibs, Storyboards, Splitting Storyboards, React Native even(!).  
We found that coding views programmatically was the best solution for us.
But coding views programmatically had its issues too: UIKit exposes an imperative, verbose API, and it's really easy to create a mess with it.
That's why we created Stevia.


## Contributors

[YannickDot](https://github.com/YannickDot),  [S4cha](https://github.com/S4cha),  [Damien](https://github.com/damien-nd),
[Snowcraft](https://github.com/Snowcraft), [Mathieu-o](https://github.com/Mathieu-o)


## Other repos ❤️
Stevia 🍃 is part of a series of lightweight libraries aiming to make developing iOS Apps a *breeze* :
- Async code : [then](https://github.com/s4cha/then)
- JSON WebServices : [ws](https://github.com/s4cha/ws)
- JSON Parsing : [Arrow](https://github.com/s4cha/Arrow)
