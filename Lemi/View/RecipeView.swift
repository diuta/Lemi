//
//  RecipeFullView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct RecipeView: View {

    let entry: RecipeModel

    @State private var selectedTab = "Steps"

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
            ActionBar()
        }
        .safeAreaPadding(10)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(
                    String(
                        "\(entry.tasteProfile) \(entry.mainIngredient) \(entry.difficulty)"
                            .capitalized
                    )
                )
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.AppTheme.textPrimary)
            }
        }

    }
}

#Preview {
    RecipeView(
        entry: RecipeDataLoader.decodeRecipes()[3]
    )
}
