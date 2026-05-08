import SwiftUI
import SwiftData

@main
struct LemiApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: BookmarkedRecipeID.self)
    }
}
