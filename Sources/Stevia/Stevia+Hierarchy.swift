//
//  Stevia+Hierarchy.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

@resultBuilder public struct SubviewsBuilder {
    public static func buildBlock(_ content: UIView...) -> [UIView] {
        return content
    }
}

public extension UIView {
    
    @available(*, deprecated, renamed: "subviews")
    @discardableResult
    func sv(_ subViews: UIView...) -> UIView {
        subviews(subViews)
    }
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
        convenience init() {
        self.init(frame: CGRect.zero)
     
         subviews(
            email,
            password,
            login
         )
        ...
     
        }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    func subviews(_ subViews: UIView...) -> UIView {
        subviews(subViews)
    }
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
        convenience init() {
        self.init(frame: CGRect.zero)
     
         subviews {
            email
            password
            login
        }
        ...
     
        }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    func subviews(@SubviewsBuilder content: () -> [UIView]) -> UIView {
        subviews(content())
    }

    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
        convenience init() {
        self.init(frame: CGRect.zero)
     
         subviews {
            email
            password
            login
        }
        ...
     
        }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    func subviews(@SubviewsBuilder content: () -> UIView) -> UIView {
        let subview = content()
        subviews(subview)
        return self
    }

    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
         convenience init() {
         self.init(frame: CGRect.zero)
         
         sv(
            email,
            password,
            login
         )
     ...
     
     }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @objc
    @available(*, deprecated, renamed: "subviews")
    @discardableResult
    func sv(_ subViews: [UIView]) -> UIView {
        subviews(subViews)
    }
    

    @discardableResult
    @objc
    func subviews(_ subViews: [UIView]) -> UIView {
        for sv in subViews {
            addSubview(sv)
            sv.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
}

public extension UITableViewCell {
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `contentView.addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     ```
     class NotificationCell: UITableViewCell {
    
        var avatar = UIImageView()
        var name = UILabel()
        var followButton = UIButton()
     
         required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
         override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier) {
     
             sv(
                avatar,
                name,
                followButton
            )
        ...
     
        }
     }
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @available(*, deprecated, renamed: "subviews")
    @discardableResult
    override func sv(_ subViews: [UIView]) -> UIView {
        contentView.subviews(subViews)
    }
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `contentView.addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     ```
     class NotificationCell: UITableViewCell {
    
        var avatar = UIImageView()
        var name = UILabel()
        var followButton = UIButton()
     
         required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
         override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier) {
     
             subviews(
                avatar,
                name,
                followButton
            )
        ...
     
        }
     }
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    override func subviews(_ subViews: [UIView]) -> UIView {
        contentView.subviews(subViews)
    }
}

public extension UICollectionViewCell {
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `contentView.addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     ```
     class PhotoCollectionViewCell: UICollectionViewCell {
     
     var avatar = UIImageView()
     var name = UILabel()
     var followButton = UIButton()
     
     
     required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
     override init(frame: CGRect) {
     super.init(frame: frame)
     
         subviews(
            avatar,
            name,
            followButton
         )
     ...
     
     }
     }
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @available(*, deprecated, renamed: "subviews")
    @discardableResult
    override func sv(_ subViews: [UIView]) -> UIView {
        contentView.subviews(subViews)
    }
    
    @discardableResult
    override func subviews(_ subViews: [UIView]) -> UIView {
        contentView.subviews(subViews)
    }
}


public extension UIStackView {
    
    @discardableResult
    func arrangedSubviews(@SubviewsBuilder content: () -> [UIView]) -> UIView {
        arrangedSubviews(content())
    }
    
    @discardableResult
    func arrangedSubviews(@SubviewsBuilder content: () -> UIView) -> UIView {
        arrangedSubviews([content()])
    }

    @discardableResult
    private func arrangedSubviews(_ subViews: UIView...) -> UIView {
        arrangedSubviews(subViews)
    }

    @discardableResult
    func arrangedSubviews(_ subViews: [UIView]) -> UIView {
        subViews.forEach { addArrangedSubview($0) }
        return self
    }
}

#endif
