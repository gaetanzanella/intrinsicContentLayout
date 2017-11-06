//
//  StackLayout.swift
//  IntrinsicLayoutContent
//
//  Created by Gaétan Zanella on 24/08/2017.
//
//

import UIKit

public struct StackLayout : IntrinsicContentLayout {

    public enum Axis {
        case horizontal, vertical
    }

    public enum Orientation {
        case left, right
    }

    public var items: [IntrinsicContentLayout]
    public var spacing: CGFloat
    public var axis: Axis
    public var orientation: Orientation

    public init(items: [IntrinsicContentLayout], spacing: CGFloat, axis: Axis, orientation: Orientation = .left) {
        self.items = items
        self.spacing = spacing
        self.axis = axis
        self.orientation = orientation
    }

    public func layout(in rect: CGRect) {
        var childRect = CGRect(origin: rect.origin, size: .zero)
        for item in items {
            let childSize = item.intrinsicSizeThatFits(rect.size)
            childRect.size = childSize
            switch (axis, orientation) {
            case (.vertical, .right) :
                childRect.origin.x = rect.origin.x + rect.size.width - childRect.size.width
            default:
                childRect.origin.x = rect.origin.x
            }
            item.layout(in: childRect)
            switch axis {
            case .horizontal:
                childRect.origin.x += childSize.width + spacing
            case .vertical:
                childRect.origin.y += childSize.height + spacing
            }
        }
    }

    public func intrinsicSizeThatFits(_ size: CGSize) -> CGSize {
        guard !items.isEmpty else { return .zero }
        let sizes = items.map({ $0.intrinsicSizeThatFits(size) })
        switch axis {
        case .horizontal:
            var width = sizes.reduce(0, { $0 + $1.width + spacing })
            width -= spacing
            var height = sizes.map({ $0.height }).max() ?? 0
            // UIViewNoIntrinsicMetric = default value of intrinsicSize = no intrinsic contents.
            // Should not occur though (given that size is passed by the client)
            if size.height != UIViewNoIntrinsicMetric {
                height = min(height, size.height)
            }
            return CGSize(width: width, height: height)
        case .vertical:
            var height = sizes.reduce(0, { $0 + $1.height + spacing })
            height -= spacing
            var width = sizes.map({ $0.width }).max() ?? 0
            if size.width != UIViewNoIntrinsicMetric {
                width = min(width, size.width)
            }
            return CGSize(width: width, height: height)
        }
    }
}
