// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [.iOS(.v15)],
    dependencies: [
        .package(path: "Packages/Localization"),
        .package(path: "Packages/LiveActivityKit")
    ]
)
