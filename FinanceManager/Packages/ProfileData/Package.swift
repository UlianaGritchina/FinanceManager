// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProfileData",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "ProfileData",
            targets: ["ProfileData"]
        ),
    ],
    dependencies: [
        .package(path: "../Core"),
    ],
    targets: [
        .target(
            name: "ProfileData",
            dependencies: [
                .product(name: "Core", package: "Core")
            ]
        ),
        .testTarget(
            name: "ProfileDataTests",
            dependencies: ["ProfileData"]
        ),
    ]
)
