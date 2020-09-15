//
//  UIEdgeInsets+Size.swift
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 12/08/2017.
//  Copyright © 2017 Gaétan Zanella. All rights reserved.
//

import UIKit

extension UIEdgeInsets {

    var horizontal: CGFloat {
        return left + right
    }

    var vertical: CGFloat {
        return top + bottom
    }
}
