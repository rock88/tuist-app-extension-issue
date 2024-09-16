import Foundation
import ProjectDescription

let project = Project(
    name: "LiveActivityApp",
    options: .options(automaticSchemesOptions: .disabled),
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
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .external(name: "LiveActivityKit"),
                .external(name: "Localization"),
                .project(target: "LiveActivity", path: .relativeToRoot("LiveActivity"))
            ]
        )
    ],
    resourceSynthesizers: []
)
