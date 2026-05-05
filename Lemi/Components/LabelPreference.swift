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
        HStack{
            Text(entry.difficulty.rawValue.capitalized)
                .frame(width: 60)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            Color.AppTheme.darkPink
                        )
                )
            Text(entry.mainIngredient.rawValue.capitalized)
                .frame(width: 60)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            Color.AppTheme.darkBlue
                        )
                )
            Text(entry.mainIngredient.rawValue.capitalized)
                .frame(width: 60)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            Color.AppTheme.darkGreen
                        )
                )
            
        }
    }
}



#Preview {
    LabelPreference(entry: RecipeDataLoader.decodeRecipes().first!
)
}
