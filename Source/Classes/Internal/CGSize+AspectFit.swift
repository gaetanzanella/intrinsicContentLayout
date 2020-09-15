//
//  CGSize+AspectFit
//  IntrinsicContentLayout
//
//  Created by Gaétan Zanella on 24/08/2017.
//
//

import UIKit

extension CGSize {

    func scaledToFit(inside size: CGSize) -> CGSize {
        guard self.height != 0 && self.width != 0 else { return .zero }
        let width = min(self.width * size.height / self.height, size.width)
        return CGSize(width: width, height: self.height * width / self.width)
    }

    func fitting(inside size: CGSize) -> CGSize {
        return CGSize(
            width: min(size.width, width),
            height: min(size.height, height)
        )
    }

    func rounded(_ rule: FloatingPointRoundingRule) -> CGSize {
        return CGSize(width: width.rounded(rule), height: height.rounded(rule))
    }
}
