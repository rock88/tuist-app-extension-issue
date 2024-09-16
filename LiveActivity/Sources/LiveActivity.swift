import ActivityKit
import LiveActivityKit
import Localization
import SwiftUI
import WidgetKit

struct LiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(
            for: LiveActivityAttributes.self,
            content: { context in
                TestView(state: context.state)
            },
            dynamicIsland: { context in
                DynamicIsland(
                    expanded: {
                        DynamicIslandExpandedRegion(.leading) {
                            TestView(state: context.state)
                        }
                        DynamicIslandExpandedRegion(.bottom) {
                            TestView(state: context.state)
                        }
                    },
                    compactLeading: {
                        TestView(state: context.state)
                    },
                    compactTrailing: {
                        TestView(state: context.state)
                    },
                    minimal: {
                        TestView(state: context.state)
                    }
                )
            }
        )
    }
}

struct TestView: View {
    let state: LiveActivityState

    var body: some View {
        if state.title == "test" {
            Text(L10n.test)
        } else {
            Text(state.title)
        }
    }
}
