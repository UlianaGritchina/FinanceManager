// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainTabView",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MainTabView",
            targets: ["MainTabView"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MainTabView"
        ),
        .testTarget(
            name: "MainTabViewTests",
            dependencies: ["MainTabView"]
        ),
    ]
)
