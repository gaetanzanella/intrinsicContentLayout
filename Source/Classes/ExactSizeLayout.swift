//
//  ExactSizeLayout.swift
//  CitadelTeam
//
//  Created by Julien Rollet on 30/10/2018.
//

import UIKit

public struct ExactSizeLayout: IntrinsicContentLayout {

    public let itemLayout: IntrinsicContentLayout
    public let exactSize: CGSize

    public init(itemLayout: IntrinsicContentLayout,
                exactSize: CGSize) {
        self.itemLayout = itemLayout
        self.exactSize = exactSize
    }

    public func intrinsicSizeThatFits(_ size: CGSize) -> CGSize {
        return exactSize
    }

    public func layout(in rect: CGRect) {
        itemLayout.layout(in: rect)
    }
}
