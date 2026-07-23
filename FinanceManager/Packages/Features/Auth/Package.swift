// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Auth",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "Auth",
            targets: ["Auth"]
        ),
    ],
    dependencies: [
        .package(path: "../AuthDomain"),
        .package(path: "../AuthData"),
    ],
    targets: [
        .target(
            name: "Auth",
            dependencies: [
                .product(name: "AuthDomain", package: "AuthDomain"),
                .product(name: "AuthData", package: "AuthData"),
            ]
        ),
        .testTarget(
            name: "AuthTests",
            dependencies: ["Auth"]
        ),
    ]
)
