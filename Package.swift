// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Methods",
    products: [
        .library(
            name: "Methods",
            targets: ["Methods"]
        ),

        .executable(
            name: "t_methods",
            targets: ["MethodsTesting"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/leviouwendijk/Testing.git",
            branch: "master"
        ),
    ],
    targets: [
        .target(
            name: "Methods"
        ),
        .executableTarget(
            name: "MethodsTesting",
            dependencies: [
                "Methods",
                .product(name: "Testing", package: "Testing"),
            ],
            path: "Testing/MethodsTesting"
        ),
    ],
    swiftLanguageModes: [.v6]
)
