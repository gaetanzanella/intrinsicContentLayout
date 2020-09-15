//
//  StackLayout.swift
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 24/08/2017.
//
//

import UIKit

public struct StackLayout : IntrinsicContentLayout {

    public enum Alignment {
        case left, right // Intended to be used with a vertical axis (no effect with horizontal axis)
        case top, bottom // Intended to be used with an horizontal axis (no effect with vertical axis)
        case centered
    }

    public enum Axis {
        case horizontal(Alignment)
        case vertical(Alignment)
    }

    public var items: [IntrinsicContentLayout]
    public var spacing: CGFloat
    public var axis: Axis

    public init(items: [IntrinsicContentLayout], spacing: CGFloat, axis: Axis) {
        self.items = items
        self.spacing = spacing
        self.axis = axis
    }

    public func layout(in rect: CGRect) {
        var childRect = CGRect(origin: rect.origin, size: .zero)
        var remainingSize = rect.size
        for item in items {
            let childSize = item.intrinsicSizeThatFits(remainingSize)
            childRect.size = childSize
            switch axis {
            case .vertical(.right):
                childRect.origin.x = rect.origin.x + rect.size.width - childRect.size.width
            case .vertical(.centered):
                childRect.origin.x = rect.origin.x + (rect.size.width - childRect.size.width) / 2.0
            case .horizontal(.bottom):
                childRect.origin.y = rect.origin.y + rect.size.height - childRect.size.height
            case .horizontal(.centered):
                childRect.origin.y = rect.origin.y + (rect.size.height - childRect.size.height) / 2.0
            default:
                break
            }
            item.layout(in: childRect)
            switch axis {
            case .horizontal:
                childRect.origin.x += childSize.width + spacing
                remainingSize.width -= childSize.width + spacing
            case .vertical:
                childRect.origin.y += childSize.height + spacing
                remainingSize.height -= childSize.height + spacing
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
            width = min(width, size.width)
            var height = sizes.map({ $0.height }).max() ?? 0
            // UIViewNoIntrinsicMetric = default value of intrinsicSize = no intrinsic contents.
            // Should not occur though (given that size is passed by the client)
            if size.height != UIView.noIntrinsicMetric {
                height = min(height, size.height)
            }
            return CGSize(width: width, height: height)
        case .vertical:
            var height = sizes.reduce(0, { $0 + $1.height + spacing })
            height -= spacing
            height = min(height, size.height)
            var width = sizes.map({ $0.width }).max() ?? 0
            if size.width != UIView.noIntrinsicMetric {
                width = min(width, size.width)
            }
            return CGSize(width: width, height: height)
        }
    }
}
