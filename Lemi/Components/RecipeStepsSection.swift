//
//  StepView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct RecipeStepsSection: View {

    let entry: RecipeModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 5) {
                ForEach(Array(entry.directions.enumerated()), id: \.element) {
                    index,
                    d in

                    HStack(spacing: 20) {
                        Text("\(index+1)")
                            .font(Font.AppTheme.sectionHeader)
                            .foregroundColor(Color.AppTheme.darkYellow)

                        VStack(alignment: .leading) {
                            Text(d)
                                .font(Font.AppTheme.regular)
                                .padding(.vertical, 15)

                            Divider()
                                .overlay(Color.AppTheme.darkYellow.opacity(0.4))
                        }

                    }

                }
            }
        }
    }
}

#Preview {
    RecipeStepsSection(
        entry: RecipeDataLoader.decodeRecipes()[3]
    )
}
