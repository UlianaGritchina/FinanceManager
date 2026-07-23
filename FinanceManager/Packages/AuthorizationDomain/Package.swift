// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthorizationDomain",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "AuthorizationDomain",
            targets: ["AuthorizationDomain"]
        ),
    ],
    targets: [
        .target(
            name: "AuthorizationDomain"
        ),
        .testTarget(
            name: "AuthorizationDomainTests",
            dependencies: ["AuthorizationDomain"]
        ),
    ]
)
