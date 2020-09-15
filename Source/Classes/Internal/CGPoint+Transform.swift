//
//  CGPoint+Transform.swift
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 12/08/2017.
//
//

import UIKit

extension CGPoint {

    func movedBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}
