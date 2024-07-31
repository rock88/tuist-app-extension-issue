// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Localization",
    defaultLocalization: "en",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Localization", targets: ["Localization"])
    ],
    targets: [
        .target(
            name: "Localization",
            resources: [
                .process("Resources/Strings")
            ]
        )
    ]
)
