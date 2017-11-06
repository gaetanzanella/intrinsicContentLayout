//
//  IntrinsicContentLayout.swift
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 07/09/2017.
//
//

import UIKit

// (gz) inspired by https://developer.apple.com/videos/play/wwdc2016/419/
public protocol IntrinsicContentLayout {
    func layout(in rect: CGRect)
    func intrinsicSizeThatFits(_ size: CGSize) -> CGSize
}
