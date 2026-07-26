// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthorizationData",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "AuthorizationData",
            targets: ["AuthorizationData"]
        ),
    ],
    dependencies: [
        .package(path: "../AuthorizationDomain"),
        .package(path: "../Core"),
    ],
    targets: [
        .target(
            name: "AuthorizationData",
            dependencies: [
                .product(name: "AuthorizationDomain", package: "AuthorizationDomain"),
                .product(name: "Core", package: "Core"),
            ]
        ),
        .testTarget(
            name: "AuthorizationDataTests",
            dependencies: ["AuthorizationData"]
        ),
    ]
)
