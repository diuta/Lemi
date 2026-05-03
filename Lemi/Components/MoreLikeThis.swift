//
//  MoreLikeThisComponent.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 02/05/26.
//

import Foundation
import SwiftUI

struct MoreLikeThis: View {

    let entry: RecipeModel
    var otherRecipes: [RecipeModel] {
        MoreLikeThisGenerator.generate(currRecipe: entry)
    }
    
    @State private var selectedRecipe: RecipeModel? = nil

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(otherRecipes) { recipe in
                        CustomCard(entry: recipe)
                            .onTapGesture {
                                selectedRecipe = recipe
                            }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
            .overlay(alignment: .leading) {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 10)
            }
            .overlay(alignment: .trailing) {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 10)
            }

        }
        .frame(height: 190)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 7,
                style: .continuous
            )
        )
        .padding(.horizontal, 20)
        .navigationDestination(item: $selectedRecipe) {
            recipe in
            RecipeView(entry: recipe)
        }
    }
}

#Preview {
    MoreLikeThis(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
}
