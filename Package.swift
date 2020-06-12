// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Pipeline",
    products: [
        .library(
            name: "Pipeline",
            targets: ["Pipeline"]),
    ],
    targets: [
        .target(
            name: "Pipeline",
            dependencies: []),
        .testTarget(
            name: "PipelineTests",
            dependencies: ["Pipeline"]),
    ]
)
