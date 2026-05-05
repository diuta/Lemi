//
//  MoreLikeThisComponent.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 02/05/26.
//

import Foundation
import SwiftUI

struct MoreSection: View {

    let entry: RecipeModel
    var otherRecipes: [RecipeModel] {
        MoreLikeThisGenerator.generate(currRecipe: entry)
    }

    @State private var selectedRecipe: RecipeModel? = nil

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(otherRecipes) { recipe in
                    MoreCard(entry: recipe)
                        .onTapGesture {
                            selectedRecipe = recipe
                        }
                }
            }
            .padding(.vertical, 15)
        }
        .navigationDestination(item: $selectedRecipe) {
            recipe in
            RecipeView(entry: recipe)
        }
    }
}

#Preview {
    MoreSection(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
}
