//
//  UIEdgeInsets+Size.swift
//  UDP
//
//  Created by Gaétan Zanella on 12/08/2017.
//  Copyright © 2017 Gaétan Zanella. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    public var horizontal: CGFloat {
        return left + right
    }

    public var vertical: CGFloat {
        return top + bottom
    }
}
