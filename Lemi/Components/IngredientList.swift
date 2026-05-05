//
//  IngredientList.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 02/05/26.
//

import SwiftUI

struct IngredientList: View {
    let entry: RecipeModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(entry.ingredients, id: \.self) { ingredient in
                    if ingredient.alternative != nil {
                        AlternativeIngredientRow(ingredient: ingredient)
                    } else {
                        DefaultIngredientRow(ingredient: ingredient)
                    }
                }
            }
        }
        //.padding(.horizontal, 20)
    }
}

struct DefaultIngredientRow: View {
    let ingredient: Ingredient
    
    var body: some View {
        HStack {
            Text(
                ingredient.measurement
            )
            .font(Font.AppTheme.ingredientMeasurement)
            .foregroundColor(Color.AppTheme.textPrimary)
            .frame(width: 75, alignment: .leading)
            
            Text(
                ingredient.name.capitalized
            )
            .font(Font.AppTheme.listName)
            .foregroundColor(Color.AppTheme.textPrimary)
            .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(.vertical, 20)
        Divider()
            .overlay(Color.AppTheme.darkBlue.opacity(0.5))
        
    }
}

struct AlternativeIngredientRow: View {
    let ingredient: Ingredient
    @State private var dragOffset: CGFloat = 0
    @State private var showingAlternative = false
    
    var body: some View {
        HStack {
            Text(
                showingAlternative
                ? (ingredient.alternativeMeasurement ?? "")
                : ingredient.measurement
            )
            .font(Font.AppTheme.ingredientMeasurement)
            .frame(width: 75, alignment: .leading)
            
            Text(
                showingAlternative
                ? (ingredient.alternative ?? "") : ingredient.name.capitalized
            )
            .font(Font.AppTheme.listName)
            .multilineTextAlignment(.leading)
            Spacer()
            
            Image(systemName: "arrow.left.arrow.right")
                .padding(10)
                .rotation3DEffect(
                    .degrees(showingAlternative ? 180 : 0),
                    axis: (x: 0.0, y: 1.0, z: 0.0) // Sumbu Y yang jadi poros putaran
                )                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        showingAlternative.toggle()
                    }
                }
        }
        .foregroundColor(Color.AppTheme.darkYellow)
        .padding(.vertical, 10)
        Divider()
            .overlay(Color.AppTheme.darkBlue.opacity(0.5))
    }
    //        .background(
    //            RoundedRectangle(cornerRadius: 12, style: .continuous)
    //                .fill(
    //                    Color.AppTheme.darkPink.opacity(0.7)
    //                )
    //        )
    // .padding(.top, 15)
    //.offset(x: dragOffset)
    //        .gesture(
    //            dragOffset(){
    //                .onChanged { gesture in
    //                    dragOffset = gesture.translation.width
    //                }
    //                .onEnded { gesture in
    //                    if abs(gesture.translation.width) > 80 {
    //                        showingAlternative.toggle()
    //                    }
    //                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6))
    //                    {
    //                        dragOffset = 0
    //                    }
    //                }
    //        )
}


#Preview {
    IngredientList(
        entry: RecipeDataLoader.decodeRecipes()[1]
    )
}
