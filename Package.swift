// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
