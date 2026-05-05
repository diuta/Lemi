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
    
    @State private var selectedTab = "Steps"
    
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
                        .frame(height: 250)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                        .overlay { ProgressView() }
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .padding(.horizontal, 20)
                
                Text(entry.title)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                    .padding(.horizontal, 20)
                
                Picker("Pilih Tab", selection: $selectedTab) {
                    Text("Ingredients").tag("Ingredients")
                    Text("Steps").tag("Steps")
                    Text("More Like This").tag("More Like This")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 20)
                
                ScrollView(.vertical) {
                    if selectedTab == "Ingredients" {
                        IngredientList(entry: entry)
                    } else if selectedTab == "Steps" {
                        RecipeSteps(entry: entry)
                    } else {
                        MoreLikeThis(entry: entry)
                    }
                }
                
            }
            Button(action: {
                toggleBookmark()
            }) {
                HStack(spacing: 8) {
                    // Switch the icon
                    Image(systemName: isBookmarked ? "bookmark.slash.fill" : "bookmark")
                    
                    // Switch the text to be an ACTION, not just a status
                    Text(isBookmarked ? "Remove from Bookmark" : "Save to Bookmark")
                        .font(.system(size: 18, weight: .bold))
                }
                .font(.AppTheme.buttonText)
                .foregroundColor(.AppTheme.textPrimary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.AppTheme.yellow)
                .clipShape(Capsule())
                
            }
            .padding(.bottom, 10)
            .safeAreaPadding(10)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(
                        String(
                            "\(entry.tasteProfile) | \(entry.mainIngredient) |  \(entry.difficulty)"
                                .capitalized
                        )
                    )
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Color.AppTheme.textPrimary)
                }
            }
            
        }
        
    }
    private func toggleBookmark() {
        if let bookmarkToDelete = savedBookmarks.first(where: { $0.id == entry.id }) {
            // It exists, so remove the ID from SwiftData
            modelContext.delete(bookmarkToDelete)
        } else {
            // It doesn't exist, so save just the ID
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
