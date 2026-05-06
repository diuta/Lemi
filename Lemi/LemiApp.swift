import SwiftUI
import SwiftData

@main
struct LemiApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        // This spins up the SwiftData database for your bookmark IDs
        .modelContainer(for: BookmarkedRecipeID.self)
    }
}
