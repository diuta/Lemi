//
//  RecipeFullView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct RecipeView: View {
    let entry: RecipeModel
    let otherRecipes: [RecipeModel]
    
    @State private var selectedTab = "Steps"
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 20) {
                    AsyncImage(
                        url: URL(
                            string: entry.imageLink ?? ""
                        )
                    ) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
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
                        } else if selectedTab == "Steps" {
                            RecipeSteps(entry: entry)
                        } else {
                            MoreLikeThis(otherRecipes: otherRecipes)
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
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    RecipeView(
        entry: SampleData.recipes.first!,
        otherRecipes: SampleData.recipes
    )
}
