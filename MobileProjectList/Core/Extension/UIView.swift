//
// Created by douglas.barreto on 4/18/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func startAnchor() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    func anchorToFit(in view: UIView, constant: CGFloat = 0) -> Self {
        return startAnchor().trailingAnchor(to: view, constant: -constant)
                            .leadingAnchor(to: view, constant: constant)
                            .bottomAnchor(to: view, constant: -constant)
                            .topAnchor(to: view, constant: constant)
    }
}

extension UIView {
    @discardableResult
    func widthAnchor(equalToConstant constant: CGFloat) -> Self {
        safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(equalToConstant constant: CGFloat) -> Self {
        safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
}

extension UIView {
    @discardableResult
    func centerYAnchor(toEqualAnchor anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func centerXAnchor(toEqualAnchor anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
}

extension UIView {
    @discardableResult
    func topAnchor(toEqualAnchor anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func topAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        return self
    }
}

extension UIView {
    @discardableResult
    func leadingAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func leadingAnchor(toEqualAnchor anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
}

extension UIView {
    @discardableResult
    func trailingAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func trailingAnchor(toEqualAnchor anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
}

extension UIView {
    @discardableResult
    func bottomAnchor(toEqualAnchor anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func bottomAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func bottomAnchor(lessThanOrEqualTo view: UIView, constant: CGFloat = 0) -> Self {
        safeAreaLayoutGuide.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant).isActive = true
        return self
    }
}
