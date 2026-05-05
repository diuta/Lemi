//
//  BookmarkTestView.swift
//  Lemi
//
//  Created by Clement N on 05/05/26.
//

import SwiftUI
import SwiftData

struct BookmarkTestView: View {
    @State private var loadedRecipes: [RecipeModel] = []
    
    @Query private var savedBookmarks: [BookmarkedRecipeID]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            Group {
                if savedBookmarks.isEmpty {
                    // Empty State
                    VStack(spacing: 16) {
                        Image(systemName: "bookmark.slash")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("Your cookbook is empty.")
                            .foregroundColor(.gray)
                    }
                } else {
                    // Populated List
                    List {
                        ForEach(savedBookmarks) { bookmark in
                            // Match the ID to the JSON data
                            if let fullRecipe = getRecipe(for: bookmark.id) {
                                NavigationLink(destination: RecipeView(entry: fullRecipe)) {
                                    // Extract the UI into a clean subview
                                    RecipeRowView(recipe: fullRecipe)
                                }
                            }
                        }
                        .onDelete(perform: deleteBookmarks)
                    }
                    // Makes the list look cleaner on iOS
                    .listStyle(.plain)
                }
            }
            .navigationTitle("My Saved Bookmarks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: GeneratorView()) {
                        Image(systemName: "wand.and.stars")
                    }
                }
            }
        }
        // 3. Fire your exact JSON decoder safely when the view loads
        .onAppear {
            if loadedRecipes.isEmpty {
                loadedRecipes = RecipeDataLoader.decodeRecipes()
            }
        }
        
    }
    private func getRecipe(for id: Int) -> RecipeModel? {
        return loadedRecipes.first(where: { $0.id == id })
    }
    
    private func deleteBookmarks(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(savedBookmarks[index])
        }
    }
}

struct RecipeRowView: View {
    let recipe: RecipeModel
    
    var body: some View {
        HStack(spacing: 16) {
            // Safe Image Loading
            if let imageString = recipe.imageLink, let url = URL(string: imageString) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if phase.error != nil {
                        FallbackThumbnail()
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                FallbackThumbnail()
            }
            
            // Recipe Info
            VStack(alignment: .leading, spacing: 6) {
                Text(recipe.title)
                    .font(.headline)
                    // Prevents long titles from pushing the UI off-screen
                    .lineLimit(2)
                
                HStack(spacing: 8) {
                    Text(recipe.difficulty.rawValue)
                    Text("•")
                    Text(recipe.tasteProfile.rawValue)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

// A tiny reusable gray square for recipes with no images
//struct FallbackThumbnail: View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 12)
//            .fill(Color.gray.opacity(0.2))
//            .frame(width: 70, height: 70)
//            .overlay(
//                Image(systemName: "fork.knife")
//                    .foregroundColor(.gray)
//            )
//    }
//}

#Preview {
    BookmarkTestView()
}
