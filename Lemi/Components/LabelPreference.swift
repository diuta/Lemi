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
                bgColor: Color.pink.opacity(0.15),
                textColor: Color.pink
            )
            
            // Main Ingredient (Blue)
            TagPill(
                text: entry.mainIngredient.rawValue.capitalized,
                bgColor: Color.blue.opacity(0.2),
                textColor: Color.blue.opacity(0.8)
            )
            
            // Taste Profile (Green)
            TagPill(
                text: entry.tasteProfile.rawValue.capitalized,
                bgColor: Color.green.opacity(0.2),
                textColor: Color.green.opacity(0.9)
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
            .background(bgColor)
            .clipShape(Capsule())
    }
}



#Preview {
    LabelPreference(entry: RecipeDataLoader.decodeRecipes().first!
)
}
