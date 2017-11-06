
import UIKit

public class AvatarImageView : UIView, IntrinsicContentLayout {

    //MARK: - Life Cycle

    public init() {
        super.init(frame: .zero)
        setupView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    //MARK: - UIView

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 40, height: 40)
    }

    //MARK: - Private

    private func setupView() {
        backgroundColor = .brown
    }
}
