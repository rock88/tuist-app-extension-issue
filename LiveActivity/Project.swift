import Foundation
import ProjectDescription

let project = Project(
    name: "LiveActivity",
    options: .options(automaticSchemesOptions: .disabled),
    targets: [
        .target(
            name: "LiveActivity",
            destinations: [.iPhone],
            product: .appExtension,
            bundleId: "com.test.LiveActivityApp.live-activity",
            deploymentTargets: .iOS("16.2"),
            infoPlist: .extendingDefault(with: [
                "NSExtension": [
                    "NSExtensionPointIdentifier": "com.apple.widgetkit-extension",
                ]
            ]),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "LiveActivityKit"),
                .external(name: "Localization"),
            ]
        ),
    ],
    resourceSynthesizers: []
)
