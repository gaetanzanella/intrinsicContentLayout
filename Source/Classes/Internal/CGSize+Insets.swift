//
//  CGSize+Insets.swift
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 12/08/2017.
//
//

import UIKit

extension CGSize {
    public func extendedBy(dx: CGFloat, dy: CGFloat) -> CGSize {
        return CGSize(width: width + dx, height: height + dy)
    }

    public func extended(by insets: UIEdgeInsets) -> CGSize {
        return extendedBy(dx: insets.horizontal, dy: insets.vertical)
    }

    public func shrinked(by insets: UIEdgeInsets) -> CGSize {
        return extendedBy(dx: -insets.horizontal, dy: -insets.vertical)
    }
}
