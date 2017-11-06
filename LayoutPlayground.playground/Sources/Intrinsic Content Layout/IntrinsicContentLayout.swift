//
//  IntrinsicContentLayout.swift
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 07/09/2017.
//
//

import UIKit

public protocol IntrinsicContentLayout {
    func layout(in rect: CGRect)
    func intrinsicSizeThatFits(_ size: CGSize) -> CGSize
}
