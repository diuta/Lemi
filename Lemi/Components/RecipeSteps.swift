//
//  StepView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct RecipeSteps: View {
    let entry: RecipeModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 5) {
                ForEach(Array(entry.directions.enumerated()), id: \.element) {
                    index,
                    d in
                    HStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(Color.AppTheme.lightGreen)
                                .frame(width: 50, height: 50)
                            Text("\(index+1)")
                                .font(Font.AppTheme.sectionHeader)
                                .foregroundColor(Color.AppTheme.textSecondary)
                        }

                        Text(d)
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
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    RecipeSteps(entry: RecipeStore.shared.recipes.first!)
}
