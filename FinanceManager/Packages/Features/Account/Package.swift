// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Account",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "Account",
            targets: ["Account"]
        ),
    ],
    dependencies: [
        .package(path: "../AccountDomain"),
        .package(path: "../AccountData"),
        .package(path: "../AuthorizationDomain"),
        .package(path: "../Core"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Account",
            dependencies: [
                .product(name: "AccountDomain", package: "AccountDomain"),
                .product(name: "AccountData", package: "AccountData"),
                .product(name: "AuthorizationDomain", package: "AuthorizationDomain"),
                .product(name: "Core", package: "Core"),
                "Swinject",
            ]
        ),
        .testTarget(
            name: "AccountTests",
            dependencies: ["Account"]
        ),
    ]
)
