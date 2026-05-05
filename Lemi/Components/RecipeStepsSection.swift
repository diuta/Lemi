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
                                .font(.system(size: 16, weight: .bold))
                                .font(Font.AppTheme.sectionHeader)
                                .foregroundColor(Color.AppTheme.darkYellow)
                                .frame(maxHeight: .infinity)
                                //.background(Color.AppTheme.darkYellow)
                            Divider()
                                .overlay(Color.AppTheme.mainBackground)
                                .frame(maxWidth: 20)

                        }


                        VStack(alignment: .leading) {
                            Text(d)
                                //.frame(maxHeight: .infinity)
                                .font(.system(size: 16))

                                .font(Font.AppTheme.listName)
                                .padding(.vertical, 15)
                                //.background(Color.AppTheme.darkYellow)

                            Divider()
                                .overlay(Color.AppTheme.darkYellow.opacity(0.4))
                                
                        }
                        .frame(maxHeight: .infinity)
                        //.background(Color.AppTheme.darkYellow)



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
