//
//  HomeView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 05/05/26.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @State private var loadedRecipes: [RecipeModel] = []

    @Query private var savedBookmarks: [BookmarkedRecipeID]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Ready to cook?")
                            .font(.AppTheme.sectionHeader.weight(.medium))
                        Text("Let's begin!")
                            .font(.AppTheme.screenTitle)
                    }

                    Text(
                        "Let’s find something from your saves that you'll\nlove cooking."
                    ).font(.AppTheme.listName)
                }

            }
            .padding(16)
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
                    ScrollView {
                        ForEach(savedBookmarks) { bookmark in
                            if let fullRecipe = getRecipe(for: bookmark.id) {
                                NavigationLink(
                                    destination: RecipeView(entry: fullRecipe)
                                ) {
                                    // Extract the UI into a clean subview
                                    CardMenu(entry: fullRecipe)
                                }
                            }
                        }
                        .padding(16)
                    }
                    .listStyle(.plain)
                }
            }
            .overlay(alignment: .bottom) {
                NavigationLink(destination: GeneratorView()) {
                    HStack(spacing: 8) {
                        Image(systemName: "wand.and.stars")
                        Text("Generate Recipe")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .foregroundColor(Color.AppTheme.textPrimary)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(Color.AppTheme.normalYellow)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                }
                .padding(.bottom, 16)
            }
        }
        .background(Color.AppTheme.mainBackground)
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

#Preview {
    HomeView()
}
