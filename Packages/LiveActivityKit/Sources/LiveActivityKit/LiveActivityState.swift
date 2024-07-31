import ActivityKit
import AppIntents

public struct LiveActivityState: Codable, Hashable {
    public let title: String

    public static func initial(title: String) -> Self {
        Self(title: title)
    }
}

public struct LiveActivityAttributes: ActivityAttributes {
    public typealias ContentState = LiveActivityState

    public init() {}
}
