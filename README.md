# IntrinsicContentLayout Sample Code

```swift
// IntrinsicContentLayout is a helper to layout a view's subviews.
// Layouting a hierarchy of views with autolayout may be very slow.
// To improve the layout speed, one may think of layouting views manually, doing frame-based
// calulations. But this is very cumbersome, and that's where IntrinsicContentLayout comes into play.
//
// IntrinsicContentLayout is in fact a helper to implement layoutSubviews (where you are supposed to
// layout your immediate subviews) and compute the size of a view before it's rendered (useful in tableviews).
// It is compliant with UIKit and Autolayout, meaning that autolayout views can be embedded in a
// IntrinsicContentLayout hierarchy.
//
// Implementation guide :
// - in the regular case, you define the layout of your view elements by assembling IntrinsicContentLayout
//   building blocks such as StackLayout, Insetlayout..  ; let's call this assembly `content`; then you just
//   have to
//    * implement intrinsicSizeThatFits(_:) where you call content.intrinsicSizeThatFits,
//    * call content.layout(in: bounds) in layoutSubviews.
// - if the layout of a view's subviews is handled by Constraints, the view can still be part of a
//   IntrinsicContentLayout hierarchy : just implement intrinsicSizeThatFits (and do nothing with layout())
//   e.g : AttachmentContainerView.
// - a similar case occurs when you wish to layout the 1st level subviews manually : layout them
//   manually in layoutSubviews and implement intrinsicSizeThatFits
//   e.g MessageItemContainerView
// - same case for "leaf" views containing a single UIKit element ad_pinned to its superview :
//   implement intrinsicSizeThatFits and customize the element in layoutSubviews
// - fixed-size elements can be treated
// - since the default implementation of `intrinsicSizeThatFits` calls `sizeThatFits`, you may override
//   sizeThatFits instead of implementing sizeThatFits.
public protocol IntrinsicContentLayout {

    // Who should override this method ?
    //  - The "geometric" building blocks of IntrinsicContentLayout (StackLayout, etc.), custom struct
    //    layouts, but NOT views.
    // When should it be explicitly called, and by whom ?
    //  - by "container" views in their layoutSubViews method, if the content is not layout by autolayout
    func layout(in rect: CGRect)

    // This method can be used to precompute the height of a view before it is rendered.
    // It is also called during the layout phase (because a view is not always given
    // the size it is requested), by the layout classes (StackLayout).
    // In general, you call it to implementent your intrinsicSizeThatFits if needed, and exceptionally
    // when you layout a view manually in layoutSubviews (MessageItemContainerView)
    func intrinsicSizeThatFits(_ size: CGSize) -> CGSize
}
```

[Example](https://github.com/gaetanzanella/IntrinsicContentLayout/blob/master/IntrinsicContentLayout_Example/IntrinsicContentLayout_Example/Classes/TableViewCell.swift)

## License

IntrinsicContentLayout is available under the MIT license. See the LICENSE file for more info.
