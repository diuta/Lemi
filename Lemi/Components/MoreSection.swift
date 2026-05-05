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
        ZStack {
            Rectangle()
                .fill(Color.AppTheme.lightYellow) 
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(otherRecipes) { recipe in
                        MoreCard(entry: recipe)
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
                    .fill(Color.AppTheme.lightYellow)
                    .frame(width: 15)
            }
            .overlay(alignment: .trailing) {
                Rectangle()
                    .fill(Color.AppTheme.lightYellow)
                    .frame(width: 15)
            }
            
            
        }
        .frame(height: 210)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 15,
                style: .continuous
            )
        )
        .navigationDestination(item: $selectedRecipe) { recipe in
            RecipeView(entry: recipe)
        }
    }
}

#Preview {
    MoreSection(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
}
