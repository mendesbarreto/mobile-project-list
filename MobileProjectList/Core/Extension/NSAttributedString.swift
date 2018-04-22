//
// Created by douglas.barreto on 4/22/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

extension NSAttributedString {
    static func titleMediumGray(withText text: String) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .gray,
                                andFont: .systemFont(ofSize: FontSize.medium, weight: .bold))
    }

    static func descriptionSmallGray(withText text: String) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .gray,
                                andFont: .systemFont(ofSize: FontSize.small, weight: .regular))
    }

    static func attributedString(withText text: String, andColor color: UIColor, andFont font: UIFont) -> NSAttributedString {
        let nuAttributes: [NSAttributedStringKey: Any] = [.foregroundColor: color,
                                                          .font: font]
        return NSAttributedString(string: text, attributes: nuAttributes)
    }
}
