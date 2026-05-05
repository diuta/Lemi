//
//  RecipeFullView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI
import SwiftData

struct RecipeView: View {
    
    let entry: RecipeModel
    
    @State private var selectedTab = "Ingredients"
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var savedBookmarks: [BookmarkedRecipeID]
    
    private var isBookmarked: Bool {
        savedBookmarks.contains(where: { $0.id == entry.id })
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: entry.imageLink ?? "")) {
                    image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(width: 370, height: 250)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(maxWidth: .infinity)
                        .frame(width: 370, height: 250)
                        .overlay { ProgressView() }
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                Text(entry.title)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                
                Picker("Pilih Tab", selection: $selectedTab) {
                    Text("Ingredients").tag("Ingredients")
                    Text("Steps").tag("Steps")
                    Text("More Like This").tag("More Like This")
                }
                .pickerStyle(.segmented)
                ScrollView(.vertical) {
                    if selectedTab == "Ingredients" {
                        IngredientList(entry: entry)
                    } else if selectedTab == "Steps" {
                        RecipeStepsSection(entry: entry)
                    } else {
                        MoreSection(entry: entry)
                    }
                }
                MainButton(isBookmarked ? "Remove from Bookmark" : "Save to Bookmark", iconName: isBookmarked ? "bookmark.slash.fill" : "bookmark") {
                    toggleBookmark()
                }
            }
            .padding(.horizontal, 20)
        }
        .safeAreaPadding(10)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(
                    "\(entry.tasteProfile) \(entry.mainIngredient) \(entry.difficulty)"
                        .capitalized
                )
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color.AppTheme.textPrimary)
            }
        }
    }

    private func toggleBookmark() {
        if let bookmarkToDelete = savedBookmarks.first(where: { $0.id == entry.id }) {
            modelContext.delete(bookmarkToDelete)
        } else {
            let newBookmark = BookmarkedRecipeID(id: entry.id)
            modelContext.insert(newBookmark)
        }
    }
}


#Preview {
    RecipeView(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
}
