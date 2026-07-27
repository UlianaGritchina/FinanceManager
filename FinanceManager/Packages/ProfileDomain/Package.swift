// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProfileDomain",
    products: [
        .library(
            name: "ProfileDomain",
            targets: ["ProfileDomain"]
        ),
    ],
    targets: [
        .target(
            name: "ProfileDomain"
        ),
        .testTarget(
            name: "ProfileDomainTests",
            dependencies: ["ProfileDomain"]
        ),
    ]
)
