// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppDI",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "AppDI",
            targets: ["AppDI"]
        ),
    ],
    dependencies: [
        .package(path: "../AppSession"),
        .package(path: "../Authorization"),
        .package(path: "../Core"),
        .package(path: "../Account"),
        .package(path: "../RootView"),
        .package(path: "../WelcomeView"),
    ],
    targets: [
        .target(
            name: "AppDI",
            dependencies: [
                .product(name: "AppSession", package: "AppSession"),
                .product(name: "Authorization", package: "Authorization"),
                .product(name: "Core", package: "Core"),
                .product(name: "Account", package: "Account"),
                .product(name: "RootView", package: "RootView"),
                .product(name: "WelcomeView", package: "WelcomeView"),
            ]
        ),
        .testTarget(
            name: "AppDITests",
            dependencies: ["AppDI"]
        ),
    ]
)
