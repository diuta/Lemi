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
                                .fill(Color(.systemGreen))
                                .frame(width: 48, height: 48)
                            Text("\(index+1)")
                                .font(.system(size: 19, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 4)
                        .padding(.bottom, 4)

                        Text(d)
                            .font(Font.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .leading
                            )
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(
                                        Color(
                                            red: 217 / 255,
                                            green: 236 / 255,
                                            blue: 250 / 255
                                        )
                                    )
                                    .frame(height: 1.5)
                            }

                    }
                    .padding(.horizontal, 20)

                }
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    RecipeSteps(entry: SampleData.recipes.first!)
}
