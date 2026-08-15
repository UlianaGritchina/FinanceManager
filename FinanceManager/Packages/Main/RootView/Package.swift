// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RootView",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "RootView",
            targets: ["RootView"]
        ),
    ],
    dependencies: [
        .package(path: "../AppSession"),
        .package(path: "../MainTabView"),
        .package(path: "../WelcomeView"),
        .package(path: "../AuthorizationDomain"),
        .package(path: "../Account"),
        .package(path: "../AccountDomain"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "RootView",
            dependencies: [
                .product(name: "AppSession", package: "AppSession"),
                .product(name: "MainTabView", package: "MainTabView"),
                .product(name: "WelcomeView", package: "WelcomeView"),
                .product(name: "AuthorizationDomain", package: "AuthorizationDomain"),
                .product(name: "Account", package: "Account"),
                .product(name: "AccountDomain", package: "AccountDomain"),
                "Swinject"
            ]
        ),
        .testTarget(
            name: "RootViewTests",
            dependencies: ["RootView"]
        ),
    ]
)
