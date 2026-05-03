import SwiftUI

@main
struct LemiApp: App {
    @State private var store = RecipeStore()
    
    var body: some Scene {
        WindowGroup {
            GeneratorView()
                .environment(store)
        }
    }
}
