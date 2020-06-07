![Stevia](https://raw.githubusercontent.com/s4cha/Stevia/master/banner.png)

[![Documentation](https://img.shields.io/badge/Read_the-Docs-67ad5c.svg)](https://freshos.github.io/SteviaDocs/)
[![Language: Swift 2, 3, 4 and 5](https://img.shields.io/badge/language-swift%205-f48041.svg?style=flat)](https://developer.apple.com/swift)
![Platform: iOS 8+](https://img.shields.io/badge/platform-iOS%20|%20tvOS-blue.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/Cocoapods-compatible-4BC51D.svg?style=flat)](https://cocoapods.org/pods/SteviaLayout)
![Swift](https://github.com/freshOS/Stevia/workflows/Swift/badge.svg)
[![Build Status](https://app.bitrise.io/app/4478e29045c5f12e/status.svg?token=pti6g-HVKBUPv9mIR3baIw)](https://app.bitrise.io/app/4478e29045c5f12e)
[![codebeat badge](https://codebeat.co/badges/5b81e292-552c-4cf1-9ccc-89d333ec8b79)](https://codebeat.co/projects/github-com-freshos-stevia-master)
[![License: MIT](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/s4cha/Stevia/blob/master/LICENSE)
[![GitHub contributors](https://img.shields.io/github/contributors/freshos/Stevia.svg)](https://github.com/freshos/Stevia/graphs/contributors)
[![GitHub tag](https://img.shields.io/github/release/freshos/Stevia.svg)]()


<p align="center">
    <a href="https://www.hackingwithswift.com/articles/9/best-alternatives-to-auto-layout">
        <img src="https://www.hackingwithswift.com/uploads/recommended@2x.png" alt="Drawing" width="300px;" />
    </a>
</p>

<p align="center">
    <a href="https://www.hackingwithswift.com/articles/9/best-alternatives-to-auto-layout">
        Winner of Hacking with Swift Recommended award
    </a>
</p>

## You + Stevia = 🦄
- [x] 💡 Write **concise**, **readable** layouts
- [x] 🏖 **Reduce** your **maintenance** time
- [x] 🎨 **Compose** your styles, **CSS-like**
- [x] 🔴 Plug **Live reload** and **boost** your iteration cycles


[Reason](#-reason) - [Example](#login-view-example) - [Live Reload](#-live-reload) - [Installation](#️-installation) - [Documentation](#-documentation)


### 🖼 Visual Layout Api
```swift
layout {
    100
    |-email-| ~ 80
    10%
    |-password-forgot-| ~ 80
    >=20
    |login| ~ 80
    0
}
```
### ⛓ Chainable Api
```swift
email.top(100).left(8).right(8).width(200).height(44)
alignHorizontally(password, forgot)
image.fillContainer()
button.centerInContainer().size(50%)
equalWidths(email, password)
image.width(>=80)
```

### 📐 Equation-Based Api
```swift
email.Top == 100
password.CenterY == forgot.CenterY
login.Top >= password.Bottom + 20
login.Width == 75 % Width
(image.Height == 100).priority = UILayoutPriority(rawValue: 999)
```

All Generate **native** NSLayoutConstraints 🎉

### 👨‍🔬Try it!

Stevia is part of [freshOS](https://github.com/freshOS) iOS toolset. Try it in an example App ! <a class="github-button" href="https://github.com/freshOS/StarterProject/archive/master.zip" data-icon="octicon-cloud-download" data-style="mega" aria-label="Download freshOS/StarterProject on GitHub">Download Starter Project</a>

### 💡 Reason
Because **nothing holds more truth than pure code** 🤓  
Xibs and storyboards are **heavy, hard to maintain, hard to merge.**  
They split the view concept into 2 separate files making debugging a **nightmare**    
*There must be a better way*

#### How
By creating a tool that makes Auto layout code finally **readable by a human being**.  
By coupling it with live code injection such as *[injectionForXcode](http://johnholdsworth.com/injection.html)* we can **design views in real time**  
View layout becomes **fun**, **concise**, **maintainable** and dare I say, *beautiful* ❤️

### Login View Example
In the project folder, you can find an example of a typical login view laid out in both native and Stevia for you to understand and compare the two approaches.

As a spoiler alert, the **number of characters** goes from 2380 to 1239 **( ~ divided by 2)**

Write **Half the code** that is actually **10X more expressive and maintainable** !

### 🔴 Live Reload

Live reload enables you to develop your views live without relaunching the app everytime.

Stevia + [InjectionForXcode](http://johnholdsworth.com/injection.html) = #WhoNeedsReactNative?? 🚀

<img src="http://g.recordit.co/i6kQfTMEpg.gif" height="300" width="360" />

*Just `Cmd+S` and you can dev live in the simulator !*

Learn more about how to set up live reload [here](https://freshos.github.io/SteviaDocs/liveReload/).


### ⚙️ Installation

`Stevia` is installed via the official [Swift Package Manager](https://swift.org/package-manager/).  

Select `Xcode`>`File`> `Swift Packages`>`Add Package Dependency...`  
and add `https://github.com/freshOS/Stevia`.

*The Swift Package Manager (SPM) is now the official way to install `stevia`. The other package managers are now deprecated as of `4.8.0` and won't be supported in future versions.  
For Carthage/Cocoapods support (legacy versions) see documentation [here](https://freshos.github.io/SteviaDocs/installation/).*

### 📖 Documentation
The following will teach you the gist of Stevia in one minute.  
To go further, you can refer to the full documentation [here](https://freshos.github.io/SteviaDocs/).


Stevia enables you to write readable Auto Layout code. It does so by tackling the 3 main components of layout: **view hierarchy**, **layout** and **styling**.

#### 01 - View hierarchy

```swift
email.translatesAutoresizingMaskIntoConstraints = false
password.translatesAutoresizingMaskIntoConstraints = false
login.translatesAutoresizingMaskIntoConstraints = false
addSubview(email)
addSubview(password)
addSubview(login)
```
becomes

```swift
subviews {
    email
    password
    login
}
```

#### 02 - Layout
```swift
email.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
email.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
email.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
email.heightAnchor.constraint(equalToConstant: 80).isActive = true

password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 8).isActive = true
password.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
password.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
password.heightAnchor.constraint(equalToConstant: 80).isActive = true

login.topAnchor.constraint(lessThanOrEqualTo: password.bottomAnchor, constant: 20).isActive = true
login.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
login.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
login.heightAnchor.constraint(equalToConstant: 80).isActive = true
login.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
```

becomes

```swift
layout {
    100
    |-email-| ~ 80
    8
    |-password-| ~ 80
    >=20
    |login| ~ 80
    0
}
```

#### 03 - Styling

```swift
email.borderStyle = .roundedRect
email.autocorrectionType = .no
email.keyboardType = .emailAddress
email.font = UIFont(name: "HelveticaNeue-Light", size: 26)
```
becomes
```swift
email.style { f in
    f.borderStyle = .roundedRect
    f.autocorrectionType = .no
    f.keyboardType = .emailAddress
    f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
    f.returnKeyType = .next
}
```


### 👨‍💻 Contributors

[YannickDot](https://github.com/YannickDot),  [S4cha](https://github.com/S4cha),  [Damien](https://github.com/damien-nd),
[Snowcraft](https://github.com/Snowcraft), [Mathieu-o](https://github.com/Mathieu-o),
[Blaz Merela](https://github.com/b1az),
[Theophane Rupin](https://github.com/trupin),
[Jason Liang](https://github.com/jyliang),
[liberty4me](https://github.com/liberty4me),
[Scott Bates](https://github.com/cowgp),
[Sai](https://github.com/sai-prasanna),
[Mike Gallagher](https://github.com/mgallagher),
[WaterNotWords](https://github.com/waternotwords),
[Mick MacCallum](https://github.com/0x7fffffff),
[Onur Genes](https://github.com/onurgenes)

### 👥 Backers
Like the project? Offer coffee or support us with a monthly donation and help us continue our activities :)

### 📲 Apps using Stevia

Many top-notch Apps with millions of users use Stevia to write better Auto Layout code:

[<img src="https://is4-ssl.mzstatic.com/image/thumb/Purple113/v4/4d/c1/70/4dc17011-3ca7-bf9a-5326-70db722686ca/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-85-220.png/230x0w.png" height="80px"/>](https://apps.apple.com/cn/app/mobike-smart-bike-sharing/id1044535426?l=en)
[<img src="https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/ac/38/7a/ac387a00-893c-66c4-8595-856ad9907c84/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png" height="80px"/>](https://apps.apple.com/us/app/id1001688546)
[<img src="https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/60/90/af/6090afc0-f2b1-40e7-d74f-78fd4f7309eb/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png" height="80px"/>](https://apps.apple.com/us/app/nerdwallet/id1174471607)
[<img src="https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/30/0c/1c/300c1c5c-2ded-02bc-a073-14c2287509e4/AppIcon-0-1x_U007emarketing-0-0-85-220-0-7.png/230x0w.png" height="80px"/>](https://apps.apple.com/in/app/yatra-flights-hotels-cabs/id730234679)
[<img src="https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/b5/a1/1d/b5a11d97-1982-6346-fab9-056ab6c55512/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png" height="80px"/>](https://apps.apple.com/us/app/yummypets-pets/id527910229)
[<img src="https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/8b/a0/64/8ba064be-c665-db32-9e63-5751c56dfb84/AppIcon-0-1x_U007emarketing-0-85-220-0-7.png/230x0w.png" height="80px"/>](https://apps.apple.com/us/app/invitation-maker-ecard/id1446598881)
[<img src="https://is5-ssl.mzstatic.com/image/thumb/Purple113/v4/94/ed/1c/94ed1cc6-dc70-9458-5ee1-f42d89d97e50/AppIcon-0-1x_U007emarketing-0-85-220-0-7.png/230x0w.png" height="80px"/>](https://apps.apple.com/us/app/logo-maker-create-design/id1455008435)
[<img src="https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/76/bf/ab/76bfabcd-d607-b944-c7ce-433ffbbd09c0/AppIconFREE-0-0-1x_U007emarketing-0-0-0-5-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png" height="80px"/>](https://apps.apple.com/us/app/smart-cleaner-clean-storage/id1194582243)
[<img src="https://is5-ssl.mzstatic.com/image/thumb/Purple49/v4/dd/54/b5/dd54b556-b289-ce8f-4a21-d7d5fb688a69/pr_source.png/230x0w.png" height="80px"/>](https://apps.apple.com/us/app/tuner-eclipse-free-guitar-tuner/id1086479185)

- [Mobike](https://apps.apple.com/cn/app/mobike-smart-bike-sharing/id1044535426?l=en) - The world’s first and largest bike sharing system.
- [Brightspace Pulse](https://apps.apple.com/us/app/id1001688546) - Education app
- [NerdWallet](https://apps.apple.com/us/app/nerdwallet/id1174471607) - Credit Score, Budget, Finance
- [Yatra](https://apps.apple.com/in/app/yatra-flights-hotels-cabs/id730234679) - Flights, Hotels & Cabs
- [Yummypets](https://apps.apple.com/us/app/yummypets-pets/id527910229) - The world's cutest social network for pet lovers
- [Invitation Maker](https://apps.apple.com/us/app/invitation-maker-ecard/id1446598881) - Greetings, Invite & Wishes
- [Logo Maker](https://apps.apple.com/us/app/logo-maker-create-design/id1455008435) - Create & Design 10,000+ Professional Logos
- [Smart Cleaner](https://apps.apple.com/us/app/smart-cleaner-clean-storage/id1194582243) - Delete Phone Photos, Contacts
- [Tuner Eclipse](https://apps.apple.com/us/app/tuner-eclipse-free-guitar-tuner/id1086479185) - Free Guitar Tuner
- and many more...

You are using Stevia ? Please let me know @[sachadso@gmail.com](sachadso@gmail.com) and I'll add you to the list 😍!


<a href="https://opencollective.com/freshos/backer/0/website" target="_blank"><img src="https://opencollective.com/freshos/backer/0/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/1/website" target="_blank"><img src="https://opencollective.com/freshos/backer/1/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/2/website" target="_blank"><img src="https://opencollective.com/freshos/backer/2/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/3/website" target="_blank"><img src="https://opencollective.com/freshos/backer/3/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/4/website" target="_blank"><img src="https://opencollective.com/freshos/backer/4/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/5/website" target="_blank"><img src="https://opencollective.com/freshos/backer/5/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/6/website" target="_blank"><img src="https://opencollective.com/freshos/backer/6/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/7/website" target="_blank"><img src="https://opencollective.com/freshos/backer/7/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/8/website" target="_blank"><img src="https://opencollective.com/freshos/backer/8/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/9/website" target="_blank"><img src="https://opencollective.com/freshos/backer/9/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/10/website" target="_blank"><img src="https://opencollective.com/freshos/backer/10/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/11/website" target="_blank"><img src="https://opencollective.com/freshos/backer/11/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/12/website" target="_blank"><img src="https://opencollective.com/freshos/backer/12/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/13/website" target="_blank"><img src="https://opencollective.com/freshos/backer/13/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/14/website" target="_blank"><img src="https://opencollective.com/freshos/backer/14/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/15/website" target="_blank"><img src="https://opencollective.com/freshos/backer/15/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/16/website" target="_blank"><img src="https://opencollective.com/freshos/backer/16/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/17/website" target="_blank"><img src="https://opencollective.com/freshos/backer/17/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/18/website" target="_blank"><img src="https://opencollective.com/freshos/backer/18/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/19/website" target="_blank"><img src="https://opencollective.com/freshos/backer/19/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/20/website" target="_blank"><img src="https://opencollective.com/freshos/backer/20/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/21/website" target="_blank"><img src="https://opencollective.com/freshos/backer/21/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/22/website" target="_blank"><img src="https://opencollective.com/freshos/backer/22/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/23/website" target="_blank"><img src="https://opencollective.com/freshos/backer/23/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/24/website" target="_blank"><img src="https://opencollective.com/freshos/backer/24/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/25/website" target="_blank"><img src="https://opencollective.com/freshos/backer/25/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/26/website" target="_blank"><img src="https://opencollective.com/freshos/backer/26/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/27/website" target="_blank"><img src="https://opencollective.com/freshos/backer/27/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/28/website" target="_blank"><img src="https://opencollective.com/freshos/backer/28/avatar.svg"></a>
<a href="https://opencollective.com/freshos/backer/29/website" target="_blank"><img src="https://opencollective.com/freshos/backer/29/avatar.svg"></a>

### 🏅 Sponsors
Become a sponsor and get your logo on our README on Github with a link to your site :)

<a href="https://opencollective.com/freshos/sponsor/0/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/1/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/2/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/3/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/4/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/5/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/6/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/7/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/8/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/9/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/9/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/10/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/10/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/11/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/11/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/12/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/12/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/13/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/13/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/14/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/14/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/15/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/15/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/16/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/16/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/17/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/17/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/18/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/18/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/19/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/19/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/20/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/20/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/21/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/21/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/22/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/22/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/23/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/23/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/24/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/24/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/25/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/25/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/26/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/26/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/27/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/27/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/28/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/28/avatar.svg"></a>
<a href="https://opencollective.com/freshos/sponsor/29/website" target="_blank"><img src="https://opencollective.com/freshos/sponsor/29/avatar.svg"></a>

### Swift Version

- Swift 2 -> [v**2.3.0**](https://github.com/freshOS/Stevia/releases/tag/2.3.0)
- Swift 3 -> [v**3.2.0**](https://github.com/freshOS/Stevia/releases/tag/3.2.0)
- Swift 4 -> [v**4.2.0**](https://github.com/freshOS/Stevia/releases/tag/4.2.0)
- Swift 4.1 -> [v**4.3.2**](https://github.com/freshOS/Stevia/releases/tag/4.3.2)
- Swift 4.2 -> [v**4.4.4**](https://github.com/freshOS/Stevia/releases/tag/4.4.4)
- Swift 5.0 -> [v**4.5.0**](https://github.com/freshOS/Stevia/releases/tag/4.5.0)
- Swift 5.1 -> [v**4.7.2**](https://github.com/freshOS/Stevia/releases/tag/4.7.2)
- Swift 5.1.2 -> [v**4.7.3**](https://github.com/freshOS/Stevia/releases/tag/4.7.3)
