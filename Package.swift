// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "IntrinsicContentLayout",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "IntrinsicContentLayout",
            targets: ["IntrinsicContentLayout"]
        ),
    ],
    targets: [
        .target(
            name: "IntrinsicContentLayout",
            path: "Source/Classes"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
