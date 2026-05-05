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
            VStack(alignment: .leading) {
                ForEach(Array(entry.directions.enumerated()), id: \.element) {
                    index,
                    d in

                    HStack(spacing: 20) {
                        VStack{
                            Text("\(index+1)")
                                .font(Font.AppTheme.boldRegular)
                                .foregroundColor(Color.AppTheme.darkYellow)
                                .frame(maxHeight: .infinity)
                                //.background(Color.AppTheme.darkYellow)
                            Divider()
                                .overlay(Color.AppTheme.mainBackground)
                                .frame(maxWidth: 20)

                        }


                        VStack(alignment: .leading) {
                            Text(d)
                                .font(Font.AppTheme.regular)
                                .padding(.vertical, 15)

                            Divider()
                                .overlay(Color.AppTheme.darkYellow.opacity(0.4))
                                
                        }
                        .frame(maxHeight: .infinity)



                    }
                    .frame(maxHeight: .infinity)

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
