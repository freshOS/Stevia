# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
Put unreleased changes here

## [4.6.0] - 2019-09-30
### Changed
- Adds support for Xcode11 & Swift 5.1

## [4.4.4] - 2019-01-03
### Changed
`fillContainer` now returns self to make it chainable

## [4.4.3] - 2019-01-03
### Changed
Fixes Equation api >= broken operator

## [4.4.2] - 2019-01-03
### Changed
Fixes view.bottom/top/right/leftConstraint possibly returning wrong constraint if the one you want is not there yet. (looking for constraint in the view itself after looking for it in the superview)
The fix makes sure it only looks for the constraint in the view itself for width and height constraints, that corresponds to constraints added via width/heightAnchors api.

## [4.4.1] - 2018-12-28
### Changed
- Make sure userAddedConstraints doesn't return layout margins. Fixes #104 Kudos @mpsnp 👏
- Code clean
- Removing deprecated tap helper (discussion here #42) alternatives : https://github.com/XCEssentials/ViewEvents

## [4.4.0] - 2018-09-18
### Changed
- Add support for Xcode10 & Swift 4.2

## [4.3.2] - 2018-09-09
### Added
- Adds support for baselines, kudos to [@bellebethcooper](https://github.com/bellebethcooper) for bringing this up 🚀

```swift
align(lastBaselines: label, label2, label3)
label.FirstBaseline == label.LastBaseline
```

### Changed
- Fixes "view.heightConstraint being nil" when set from IB or anchors.  Thanks [@leidi0129](https://github.com/leidi0129) for spotting the issue 👏

## [4.3.0] - 2018-04-04
### Changed
- Supports Xcode 9.3 & Swift 4.1

## [4.2.0] - 2018-01-09

### Changed
- `==` operator now works even if views are not at the same level in the view hierarchy
- `==` operator is now reflexive
- Re-opening Layout([array]) overload Some needed it for dynamic layout so it's back :)



## [4.1.0] - 2017-11-20

### Added
- UILayoutSupport & UILayoutGuide are now supported in Equation base api.

## [4.1.0] - 2017-09-29

### Changed
- Supports Xcode 9 & Swift 4

## [3.2.0] - 2017-06-14

### Changed
- Size constraints such as width and height can now be added without the need for a superview.

### Added
- New leadingConstraint & trailingConstraint property

- Kudos to [@trupin](https://github.com/trupin) and [@cowgp](https://github.com/cowgp) for this release 🎉

## [3.1.4] - 2017-06-14

### Added
- tvOS Support

## [3.1.4] - 2017-06-14

### Changed
- Built with Xcode 8.3.1
