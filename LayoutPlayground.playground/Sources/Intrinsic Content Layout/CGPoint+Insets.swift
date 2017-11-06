import UIKit

public extension CGPoint {
    public func movedTo(_ dx: CGFloat, _ dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}
