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
        .padding(.horizontal, 20)
    }
}

struct DefaultIngredientRow: View {
    let ingredient: Ingredient

    var body: some View {
        HStack {
            Text(
                ingredient.name
            )
            .font(Font.AppTheme.listName)
            .foregroundColor(Color.AppTheme.textPrimary)
            .padding(.leading, 10)

            Spacer()

            Text(
                ingredient.measurement
            )
            .font(Font.AppTheme.ingredientMeasurement)
            .foregroundColor(Color.AppTheme.textPrimary)
            .padding(.trailing, 10)
        }
        .padding(.vertical, 20)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(Color.AppTheme.darkBlue.opacity(0.2))
                .frame(height: 1)
        }
    }
}

struct AlternativeIngredientRow: View {
    let ingredient: Ingredient
    @State private var dragOffset: CGFloat = 0
    @State private var showingAlternative = false

    var body: some View {
        HStack {
            Text("«")
                .foregroundColor(Color.AppTheme.textSecondary)

            Text(
                showingAlternative
                    ? (ingredient.alternative ?? "") : ingredient.name
            )
            .font(Font.AppTheme.listName)
            .foregroundColor(Color.AppTheme.textSecondary)
            .padding(.leading, 10)

            Spacer()

            Text(
                showingAlternative
                    ? (ingredient.alternativeMeasurement ?? "")
                    : ingredient.measurement
            )
            .font(Font.AppTheme.ingredientMeasurement)
            .foregroundColor(Color.AppTheme.textSecondary)
            .padding(.trailing, 10)

            Text("»")
                .foregroundColor(Color.AppTheme.textSecondary)

        }
        .padding(.horizontal, 12)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(
                    Color.AppTheme.darkPink.opacity(0.7)
                )
        )
        .padding(.top, 15)
        .offset(x: dragOffset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    dragOffset = gesture.translation.width
                }
                .onEnded { gesture in
                    if abs(gesture.translation.width) > 80 {
                        showingAlternative.toggle()
                    }
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6))
                    {
                        dragOffset = 0
                    }
                }
        )
    }
}

#Preview {
    IngredientList(
        entry: RecipeDataLoader.decodeRecipes()[1]
    )
}
