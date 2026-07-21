// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthData",
    products: [
        .library(
            name: "AuthData",
            targets: ["AuthData"]
        ),
    ],
    targets: [
        .target(
            name: "AuthData"
        ),
        .testTarget(
            name: "AuthDataTests",
            dependencies: ["AuthData"]
        ),
    ]
)
