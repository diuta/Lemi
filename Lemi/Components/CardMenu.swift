//
//  CardMenu.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 05/05/26.
//

import SwiftUI

struct CardMenu: View {
    
    let entry: RecipeModel
    
    var body: some View {
        VStack(spacing: 14) {
            ZStack(alignment: .topTrailing){
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
                .frame(maxWidth: .infinity, maxHeight: 225)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .clipped()
                
                LabelPreference(entry: entry)
                    .padding(10)
                
            }
            
            
            VStack (alignment: .leading, spacing: 5){
                Text(entry.title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color.AppTheme.textPrimary)
                
                //ganti ke dynamic
                Text("Addded 04 May 2026")
                    .foregroundColor(Color.AppTheme.darkPink)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            //.padding(.horizontal, 10)
        }
        .padding(15)
        .frame(maxWidth: 370)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.AppTheme.lightGreen, lineWidth: 1)
        )
        //.padding(5)
        .buttonStyle(PlainButtonStyle())
        .shadow(
            color: Color.black.opacity(0.15),
            radius: 4, 
            x: 0,
            y: 6
        )
    }
}

#Preview {
    CardMenu(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
    
}

