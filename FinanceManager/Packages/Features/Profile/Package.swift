// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Profile",
    platforms: [ .iOS(.v17) ],
    products: [
        .library(
            name: "Profile",
            targets: ["Profile"]
        ),
    ],
    dependencies: [
        .package(path: "../ProfileDomain"),
        .package(path: "../ProfileData"),
        .package(path: "../Core"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(
            name: "Profile",
            dependencies: [
                .product(name: "ProfileDomain", package: "ProfileDomain"),
                .product(name: "ProfileData", package: "ProfileData"),
                .product(name: "Core", package: "Core"),
                "Swinject",
            ]
        ),
        .testTarget(
            name: "ProfileTests",
            dependencies: ["Profile"]
        ),
    ]
)
