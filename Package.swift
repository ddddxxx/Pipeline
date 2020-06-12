// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "ChainingFunction",
    products: [
        .library(
            name: "ChainingFunction",
            targets: ["ChainingFunction"]),
    ],
    targets: [
        .target(
            name: "ChainingFunction",
            dependencies: []),
        .testTarget(
            name: "ChainingFunctionTests",
            dependencies: ["ChainingFunction"]),
    ]
)
