//
//  CGSize+greatestFiniteMagnitude.swift
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 07/09/2017.
//
//

import UIKit

extension CGSize {

    static var greatestFiniteMagnitude: CGSize {
        return CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    }
}
