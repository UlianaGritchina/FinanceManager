// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthData",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "AuthData",
            targets: ["AuthData"]
        ),
    ],
    dependencies: [
        .package(path: "../AuthDomain"),
        .package(path: "../Core"),
    ],
    targets: [
        .target(
            name: "AuthData",
            dependencies: [
                .product(name: "AuthDomain", package: "AuthDomain"),
                .product(name: "Core", package: "Core"),
            ]
        ),
        .testTarget(
            name: "AuthDataTests",
            dependencies: ["AuthData"]
        ),
    ]
)
