// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Home",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]
        ),
    ],
    dependencies: [
        .package(path: "../AppSession"),
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                .product(name: "AppSession", package: "AppSession"),
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]
        ),
    ]
)
