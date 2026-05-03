//
//  MoreLikeThisComponent.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 02/05/26.
//

import Foundation
import SwiftUI

struct MoreLikeThis: View {
    
    let current: RecipeModel
    var otherRecipes: [RecipeModel] { MoreLikeThisGenerator.generate(currRecipe: current) }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(otherRecipes) { recipe in
                        CustomCard(entry: recipe)
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
    }
}

#Preview {
    MoreLikeThis(current: RecipeStore.shared.recipes.first!)
}
