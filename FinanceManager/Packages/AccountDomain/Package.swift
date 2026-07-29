// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AccountDomain",
    products: [
        .library(
            name: "AccountDomain",
            targets: ["AccountDomain"]
        ),
    ],
    targets: [
        .target(
            name: "AccountDomain"
        ),
        .testTarget(
            name: "AccountDomainTests",
            dependencies: ["AccountDomain"]
        ),
    ]
)
