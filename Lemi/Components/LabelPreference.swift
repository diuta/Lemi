//
//  LabelPreference.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 05/05/26.
//

import SwiftUI

struct LabelPreference: View {
    let entry: RecipeModel

    var body: some View {
        HStack(spacing: 12) {
            // Difficulty (Pink)
            TagPill(
                text: entry.difficulty.rawValue.capitalized,
                bgColor: Color.AppTheme.lightPink,
                textColor: Color.AppTheme.textSecondary
            )
            
            // Main Ingredient (Blue)
            TagPill(
                text: entry.mainIngredient.rawValue.capitalized,
                bgColor: Color.AppTheme.lightBlue,
                textColor: Color.AppTheme.textSecondary
            )
            
            // Taste Profile (Green)
            TagPill(
                text: entry.tasteProfile.rawValue.capitalized,
                bgColor: Color.AppTheme.lightGreen,
                textColor: Color.AppTheme.textSecondary
            )
        }
    }
}

struct TagPill: View {
    let text: String
    let bgColor: Color
    let textColor: Color
    
    var body: some View {
        Text(text)
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(textColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .clipShape(Capsule())
    }
}



#Preview {
    LabelPreference(entry: RecipeDataLoader.decodeRecipes().first!
)
}
