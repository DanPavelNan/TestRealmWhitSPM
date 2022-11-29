// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyPackageForRealm",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MyPackageForRealm",
            targets: ["MyPackageForRealm"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift", from: "10.32.3")
    ],
    targets: [
        .target(
            name: "MyPackageForRealm",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")]),
        .testTarget(
            name: "MyPackageForRealmTests",
            dependencies: ["MyPackageForRealm"]),
    ]
)
