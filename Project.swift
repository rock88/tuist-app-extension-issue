import Foundation
import ProjectDescription

let project = Project(
    name: "LiveActivityApp",
    targets: [
        .target(
            name: "LiveActivityApp",
            destinations: [.iPhone],
            product: .app,
            bundleId: "com.test.LiveActivityApp",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchStoryboardName": "LaunchScreen",
                "NSCameraUsageDescription": "Example",
                "NSContactsUsageDescription": "Example",
                "NSLocationAlwaysAndWhenInUseUsageDescription": "Example",
                "NSLocationWhenInUseUsageDescription": "Example",
                "NSPhotoLibraryUsageDescription": "Example",
                "NSSupportsLiveActivities": .boolean(true)
            ]),
            sources: ["LiveActivityApp/**/*.swift"],
            resources: ["LiveActivityApp/Resources/**"],
            dependencies: [
                .external(name: "LiveActivityKit"),
                .external(name: "Localization"),
                .target(name: "LiveActivity")
            ]
        ),
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
            sources: ["LiveActivity/**/*.swift"],
            dependencies: [
                .external(name: "LiveActivityKit"),
                .external(name: "Localization"),
            ]
        ),
    ],
    schemes: [
        .scheme(
            name: "LiveActivityApp",
            shared: true,
            buildAction: .buildAction(
                targets: ["LiveActivityApp"]
            ),
            runAction: .runAction(
                executable: "LiveActivityApp",
                arguments: .arguments(environmentVariables: ["OS_ACTIVITY_MODE": "disable"])
            )
        )
    ],
    resourceSynthesizers: []
)
