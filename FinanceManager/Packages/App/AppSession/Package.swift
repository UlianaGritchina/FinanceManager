// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppSession",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "AppSession",
            targets: ["AppSession"]
        ),
    ],
    dependencies: [
        .package(path: "../AuthorizationDomain"),
        .package(path: "../AccountDomain"),
        .package(path: "../Core"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "AppSession",
            dependencies: [
                .product(name: "AuthorizationDomain", package: "AuthorizationDomain"),
                .product(name: "AccountDomain", package: "AccountDomain"),
                .product(name: "Core", package: "Core"),
                "Swinject"
            ]
        ),
        .testTarget(
            name: "AppSessionTests",
            dependencies: ["AppSession"]
        ),
    ]
)
