import SwiftUI
import SwiftData

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Brush())
                .modelContainer(for: Drawing.self)
        }
    }
}
