import ProjectDescription

let workspace = Workspace(
    name: "LiveActivity",
    projects: [
        "LiveActivityApp",
        "LiveActivity"
    ],
    schemes: [
        .scheme(
            name: "LiveActivityApp",
            shared: true,
            buildAction: .buildAction(
                targets: [.project(path: "LiveActivityApp", target: "LiveActivityApp")]
            ),
            runAction: .runAction(
                executable: .project(path: "LiveActivityApp", target: "LiveActivityApp"),
                arguments: .arguments(environmentVariables: ["OS_ACTIVITY_MODE": "disable"])
            )
        )
    ]
)
