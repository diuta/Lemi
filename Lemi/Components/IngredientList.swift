//
//  IngredientList.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 02/05/26.
//

import SwiftUI

struct IngredientList: View {
    let entry : RecipeModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(entry.ingredients, id: \.self) { ingredient in
                    HStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.AppTheme.darkBlue.opacity(0.2), lineWidth: 1)
                                .frame(width: 50, height: 50)
                        }
                        Text(ingredient)
                            .font(Font.AppTheme.pillText)
                            .padding(.bottom, 5)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .leading
                            )
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(
                                        Color.AppTheme.darkBlue.opacity(0.2)
                                    )
                                    .frame(height: 1.5)
                            }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    IngredientList(entry: SampleData.recipes.first!)
}
