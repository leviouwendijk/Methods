// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Methods",
    products: [
        .library(
            name: "Methods",
            targets: ["Methods"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Methods"
        ),
    ],
    swiftLanguageModes: [.v6]
)
