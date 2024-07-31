import ActivityKit
import Foundation

public struct LiveActivity: Identifiable, Hashable {
    public let id: String
    public let state: LiveActivityState
}

public enum LiveActivityClientError: Error {
    case disabled
    case liveActivityNotFound
}

@available(iOS 16.2, *)
public struct LiveActivityClient {
    public var request: (_ state: LiveActivityState) async throws -> LiveActivity
    public var update: (_ activity: LiveActivity, _ state: LiveActivityState) async throws -> Void
    public var end: (_ activity: LiveActivity, _ policy: ActivityUIDismissalPolicy) async throws -> Void
}

@available(iOS 16.2, *)
extension LiveActivityClient {
    public static let liveValue = Self(
        request: { state in
            guard ActivityAuthorizationInfo().areActivitiesEnabled else {
                throw LiveActivityClientError.disabled
            }

            let activity = try Activity.request(
                attributes: LiveActivityAttributes(),
                content: ActivityContent(state: state, staleDate: nil),
                pushType: nil
            )
            return activity.liveActivity
        },
        update: { activity, state in
            try await Activity.activities.find({ $0.id == activity.id }).update(using: state)
        },
        end: { activity, policy in
            let activity = try Activity.activities.find { $0.id == activity.id }
            await activity.end(nil, dismissalPolicy: policy)
        }
    )
}

@available(iOS 16.2, *)
typealias Activity = ActivityKit.Activity<LiveActivityAttributes>

@available(iOS 16.2, *)
private extension Activity {
    var liveActivity: LiveActivity {
        LiveActivity(id: id, state: content.state)
    }
}

private extension Array {
    func find(_ predicate: (Element) -> Bool) throws -> Element {
        if let activity = first(where: predicate) {
            return activity
        }
        throw LiveActivityClientError.liveActivityNotFound
    }
}
