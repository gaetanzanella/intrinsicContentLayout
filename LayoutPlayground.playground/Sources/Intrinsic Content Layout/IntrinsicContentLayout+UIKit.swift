//
//  IntrinsicContentLayout+UIKit.swift
//  IntrinsicLayoutContent
//
//  Created by Gaétan Zanella on 24/08/2017.
//
//

import UIKit

extension IntrinsicContentLayout where Self : UIView {
    public func layout(in rect: CGRect) {
        frame = rect
    }

    public func intrinsicSizeThatFits(_ size: CGSize) -> CGSize {
        return sizeThatFits(size)
    }
}
extension UILabel : IntrinsicContentLayout {}
extension UITextView : IntrinsicContentLayout {}

extension UIImageView : IntrinsicContentLayout {
    public func intrinsicSizeThatFits(_ size: CGSize) -> CGSize {
        // `UIImageView` does not calculate its size `that fits` the given one,
        // it just returns its image size.
        return sizeThatFits(size).scaledToFit(inside: size)
    }
}
