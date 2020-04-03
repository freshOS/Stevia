//
//  Stevia+Hierarchy.swift
//  LoginStevia
//
//  Created by Sacha Durand Saint Omer on 01/10/15.
//  Copyright © 2015 Sacha Durand Saint Omer. All rights reserved.
//

#if canImport(UIKit)
import UIKit

@_functionBuilder public struct SubviewsBuilder {
    public static func buildBlock(_ content: UIView...) -> [UIView] {
        return content
    }
}

public extension UIView {
    
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
//    @available(*, deprecated, message: "Use Subviews { } function builder instead.")
    @discardableResult
    func sv(_ subViews: UIView...) -> UIView {
        return sv(subViews)
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
     
         Subviews {
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
    func Subviews(@SubviewsBuilder content: () -> [UIView]) -> UIView {
        let subviews = content()
        sv(subviews)
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
     
         Subviews {
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
    func Subviews(@SubviewsBuilder content: () -> UIView) -> UIView {
        let subview = content()
        sv(subview)
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
    @objc @discardableResult
    func sv(_ subViews: [UIView]) -> UIView {
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
    @discardableResult
    override func sv(_ subViews: [UIView]) -> UIView {
        return contentView.sv(subViews)
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
    @discardableResult
    override func sv(_ subViews: [UIView]) -> UIView {
        return contentView.sv(subViews)
    }
}
#endif
