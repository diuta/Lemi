//
//  MoreCard.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct CustomCard: View {
    
    let entry: RecipeModel

    var body: some View {
        NavigationLink(destination: RecipeView(entry: entry)){
            VStack(spacing: 11) {
                AsyncImage(
                    url: URL(
                        string: entry.imageLink ?? ""
                    )
                ) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .clipped()
                
                Text(entry.title)
                    .font(.system(size: 13, weight: .bold))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                
            }
            .padding(10)
            .frame(width: 100, height: 158)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.AppTheme.lightGreen, lineWidth: 1)
            )
            .padding(5)
            
        }
    }
}

#Preview {
    NavigationStack{
        CustomCard(
            entry: RecipeDataLoader.decodeRecipes().first!
        )
    }
}
