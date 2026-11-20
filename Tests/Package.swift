// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "MethodsTests",
    products: [

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
        .package(path: ".."),
    ],
    targets: [
        .executableTarget(
            name: "MethodsTesting",
            dependencies: [
                .product(name: "Methods", package: "Methods"),
                .product(name: "Testing", package: "Testing"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
