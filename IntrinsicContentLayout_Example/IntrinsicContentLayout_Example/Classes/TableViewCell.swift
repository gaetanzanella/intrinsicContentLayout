//
//  TableViewCell.swift
//  IntrinsicContentLayout_Example
//
//  Created by Gaétan Zanella on 15/09/2020.
//  Copyright © 2020 Fabernovel. All rights reserved.
//

import UIKit
import IntrinsicContentLayout

class TableViewCell: UITableViewCell {

    private let iconImageView = UIImageView()
    private let userLabel = UILabel()
    private let messageLabel = UILabel()

    // MARK: - UITableViewCell

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    // MARK: - UIView

    override func layoutSubviews() {
        super.layoutSubviews()
        makeLayout().layout(in: bounds)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        makeLayout().intrinsicSizeThatFits(size)
    }

    // MARK: - Private

    private func setUp() {
        contentView.addSubview(iconImageView)
        iconImageView.backgroundColor = .red
        contentView.addSubview(userLabel)
        userLabel.text = "User"
        contentView.addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }

    private func makeLayout() -> IntrinsicContentLayout {
        InsetLayout(
            content: StackLayout(
                items: [
                    StackLayout(
                        items: [
                            ExactSizeLayout(
                                itemLayout: iconImageView,
                                exactSize: CGSize(width: 80, height: 80)
                            ),
                            userLabel
                        ],
                        spacing: 8,
                        axis: .horizontal(.centered)
                    ),
                    messageLabel
                ],
                spacing: 8,
                axis: .vertical(.top)
            ),
            insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        )
    }
}
