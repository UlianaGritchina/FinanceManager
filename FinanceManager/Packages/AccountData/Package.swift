// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AccountData",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "AccountData",
            targets: ["AccountData"]
        ),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(path: "../AccountDomain"),
    ],
    targets: [
        .target(
            name: "AccountData",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "AccountDomain", package: "AccountDomain")
            ]
        ),
        .testTarget(
            name: "AccountDataTests",
            dependencies: ["AccountData"]
        ),
    ]
)
