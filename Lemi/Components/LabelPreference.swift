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
        HStack(spacing: 8) {
            TagPill(
                text: entry.difficulty.rawValue.capitalized,
                bgColor: Color.AppTheme.normalPink,
                textColor: Color.AppTheme.textSecondary
            )
            
            TagPill(
                text: entry.mainIngredient.rawValue.capitalized,
                bgColor: Color.AppTheme.normalBlue,
                textColor: Color.AppTheme.textSecondary
            )
            
            TagPill(
                text: entry.tasteProfile.rawValue.capitalized,
                bgColor: Color.AppTheme.normalGreen,
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
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(textColor)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .clipShape(Capsule())
    }
}



#Preview {
    LabelPreference(entry: RecipeDataLoader.decodeRecipes().first!
)
}
