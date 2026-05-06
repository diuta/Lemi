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
    @State private var toGenerator: Bool = false

    @Query private var savedBookmarks: [BookmarkedRecipeID]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            if savedBookmarks.isEmpty {
                VStack(spacing: 75) {
                    VStack(spacing: 10) {
                        Text("🥺")
                            .font(.system(size: 100))
                        Text("You don't have any saved recipes yet")
                            .font(.AppTheme.sectionHeader)
                            .multilineTextAlignment(.center)
                    }

                    VStack(spacing: 10) {
                        Text("LEMI help you to create one!")
                            .font(.AppTheme.sectionTitle)

                        MainButton("Generate Menu", iconName: "sparkles") {
                            toGenerator = true
                        }
                    }
                }
                .padding(16)
                .navigationDestination(isPresented: $toGenerator) {
                    GeneratorView()
                }

            } else {
                VStack(alignment: .leading, spacing: 25) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ready to cook?")
                            .font(.AppTheme.sectionHeader.weight(.medium))
                        HStack(spacing: 6) {
                            Text("LEMI")
                                .font(.AppTheme.screenTitle)
                                .foregroundColor(Color.AppTheme.normalYellow)
                            Text("help you!")
                                .font(.AppTheme.screenTitle)
                        }
                        Text("All your saved recipes are here!")
                            .font(.AppTheme.regular)
                    }

                    ZStack {
                        ScrollView {
                            ForEach(savedBookmarks) { bookmark in
                                if let fullRecipe = getRecipe(for: bookmark.id) {
                                    NavigationLink(
                                        destination: RecipeView(entry: fullRecipe)
                                    ) {
                                        CardMenu(entry: fullRecipe)
                                    }
                                }
                            }
                            .padding(16)
                        }
                        .listStyle(.plain)

                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                MainButton("Generate Menu", iconName: "sparkles") {
                                    toGenerator = true
                                }
                            }
                            .padding(.trailing, 20)
                            .padding(.bottom, 30)
                        }
                    }
                }
                .padding(16)
                .navigationDestination(isPresented: $toGenerator) {
                    GeneratorView()
                }
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
