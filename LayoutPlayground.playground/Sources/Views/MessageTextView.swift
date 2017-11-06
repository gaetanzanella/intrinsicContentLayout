import UIKit

public class MessageTextView : UIView, IntrinsicContentLayout {

    private let backgroundLayer = CAShapeLayer()

    private let label = UILabel()

    private var insetLayout: IntrinsicContentLayout {
        return InsetLayout(content: label, insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }

    public var text: String? {
        set {
            label.text = newValue
        }
        get {
            return label.text
        }
    }

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

    public override func layoutSubviews() {
        super.layoutSubviews()
        insetLayout.layout(in: bounds)
        backgroundLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return insetLayout.intrinsicSizeThatFits(size)
    }

    //MARK: - Private

    private func setupView() {
        layer.addSublayer(backgroundLayer)
        backgroundLayer.fillColor = UIColor.lightGray.cgColor
        addSubview(label)
        label.numberOfLines = 0
    }
}
