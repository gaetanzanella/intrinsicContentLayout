import UIKit

private struct Constant {
    static let avatarContentSpacing: CGFloat = 8
}

public struct MessageContentLayout : IntrinsicContentLayout {

    public let orientation: StackLayout.Orientation
    public let avatar: IntrinsicContentLayout
    public let header: IntrinsicContentLayout
    public let content: IntrinsicContentLayout
    public let preview: IntrinsicContentLayout?

    public init(orientation: StackLayout.Orientation,
                avatar: IntrinsicContentLayout,
                header: IntrinsicContentLayout,
                content: IntrinsicContentLayout,
                preview: IntrinsicContentLayout?) {
        self.orientation = orientation
        self.avatar = avatar
        self.header = header
        self.content = content
        self.preview = preview
    }

    //MARK: - Private

    private var contentLayout: IntrinsicContentLayout {
        return StackLayout(
            items: [header, content],
            spacing: 8,
            axis: .vertical,
            orientation: orientation
        )
    }

    private var contentWithPreviewLayout: IntrinsicContentLayout {
        if let preview = preview {
            return StackLayout(
                items: [contentLayout, preview],
                spacing: 8,
                axis: .vertical,
                orientation: orientation
            )
        }
        return contentLayout
    }

    //MARK: - IntrinsicContentLayout

    public func layout(in rect: CGRect) {
        let avatarSize = avatar.intrinsicSizeThatFits(rect.size)
        let avatarLeftSpace = avatarSize.width + Constant.avatarContentSpacing
        let content = contentLayout
        let contentAvailableSize = rect.size.extendedBy(dx: -avatarLeftSpace, dy: 0)
        let contentSize = content.intrinsicSizeThatFits(contentAvailableSize)
        let avatarOrigin: CGPoint
        let contentOrigin: CGPoint
        switch orientation {
        case .left:
            avatarOrigin = rect.origin.movedTo(
                0,
                contentSize.height - avatarSize.height
            )
            contentOrigin = rect.origin.movedTo(
                avatarLeftSpace,
                0
            )
        case .right:
            avatarOrigin = rect.origin.movedTo(
                rect.width - avatarSize.width,
                contentSize.height - avatarSize.height
            )
            contentOrigin = rect.origin.movedTo(
                rect.size.width - (avatarLeftSpace + contentSize.width),
                0
            )
        }
        let contentWithPreview = contentWithPreviewLayout
        let contentWithPreviewSize = contentWithPreview.intrinsicSizeThatFits(contentAvailableSize)
        let avatarRect = CGRect(origin: avatarOrigin, size: avatarSize)
        let contentRect = CGRect(origin: contentOrigin, size: contentWithPreviewSize)
        avatar.layout(in: avatarRect)
        contentWithPreview.layout(in: contentRect)
    }

    public func intrinsicSizeThatFits(_ size: CGSize) -> CGSize {
        let contentSize = contentWithPreviewLayout.intrinsicSizeThatFits(size)
        let avatarSize = avatar.intrinsicSizeThatFits(size)
        return contentSize.extendedBy(dx: avatarSize.width + Constant.avatarContentSpacing, dy: 0)
    }
}
