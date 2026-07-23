// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Authorization",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "Authorization",
            targets: ["Authorization"]
        ),
    ],
    dependencies: [
        .package(path: "../AuthorizationDomain"),
        .package(path: "../AuthorizationData"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Authorization",
            dependencies: [
                .product(name: "AuthorizationDomain", package: "AuthorizationDomain"),
                .product(name: "AuthorizationData", package: "AuthorizationData"),
            ]
        ),
        .testTarget(
            name: "AuthorizationTests",
            dependencies: ["Authorization"]
        ),
    ]
)
