import SwiftUI

@main
struct LiveActivityApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.2, *) {
                ContentView()
            } else {
                Text("Unsupport")
            }
        }
    }
}
