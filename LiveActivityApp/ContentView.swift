import SwiftUI
import Localization
import LiveActivityKit

@available(iOS 16.2, *)
struct ContentView: View {
    @ObservedObject
    var viewModel = ViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Localization: \(L10n.test)")

            Button("Request LiveActivity", action: viewModel.requestLiveActivity)

            VStack(alignment: .leading) {
                Text("Update:")
                Button("Localized") { viewModel.updateLiveActivity(state: .initial(title: "test")) }
                Button("End", action: viewModel.end)
            }
            .padding()
        }
    }
}

@available(iOS 16.2, *)
final class ViewModel: ObservableObject {
    let client: LiveActivityClient = .liveValue

    var activity: LiveActivity?

    func perform(handler: @escaping () async throws -> Void) {
        Task {
            do {
                try await handler()
            } catch {
                print(error)
            }
        }
    }

    func requestLiveActivity() {
        perform {
            let activity = try await self.client.request(.initial(title: "Hi!"))
            print(activity)
            self.activity = activity
        }
    }

    func updateLiveActivity(state: LiveActivityState) {
        guard let activity else { return }

        perform {
            try await self.client.update(activity, state)
        }
    }

    func end() {
        guard let activity else { return }

        perform {
            try await self.client.end(activity, .immediate)
        }
    }
}
