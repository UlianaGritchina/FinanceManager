// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WelcomeView",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "WelcomeView",
            targets: ["WelcomeView"]
        ),
    ],
    dependencies: [
        .package(path: "../AccountDomain"),
        .package(path: "../Account"),
        .package(path: "../Authorization"),
        .package(path: "../Core"),
        .package(path: "../AppSessoin"),
    ],
    targets: [
        .target(
            name: "WelcomeView",
            dependencies: [
                .product(name: "AccountDomain", package: "AccountDomain"),
                .product(name: "Account", package: "Account"),
                .product(name: "Authorization", package: "Authorization"),
                .product(name: "AppSessoin", package: "AppSessoin"),
                .product(name: "Core", package: "Core"),
            ]
        ),
        .testTarget(
            name: "WelcomeViewTests",
            dependencies: ["WelcomeView"]
        ),
    ]
)
