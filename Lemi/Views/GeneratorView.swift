//
//  GeneratorView.swift
//  Lemi
//
//  Created by Clement N on 30/04/26.
//

import SwiftUI

struct GeneratorView: View {

    @State private var selectedDifficulty: Difficulty? = nil
    @State private var selectedIngredient: MainIngredient? = nil
    @State private var selectedTaste: TasteProfile? = nil
    @State private var generatedRecipe: RecipeModel? = nil
    @State private var showErrorAlert: Bool = false

    let difficulties = Difficulty.allCases
    let ingredients = MainIngredient.allCases
    let tastes = TasteProfile.allCases

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Choose your ...")
                    .font(Font.AppTheme.screenTitle)
                    .foregroundColor(Color.AppTheme.textPrimary)
                    .padding()
                VStack(spacing: 15) {
                    PreferenceCard(
                        title: "Difficulty",
                        bgColor: Color.AppTheme.lightPink,
                        bgImageName: "DifficultyAsset"
                        
                    ) {
                        HStack(spacing: 10) {
                            ForEach(difficulties, id: \.self) { difficulty in
                                SelectionButton(
                                    text: difficulty.rawValue,
                                    bgColor: Color.AppTheme.darkPink,
                                    isSelected: selectedDifficulty == difficulty
                                ) {
                                    selectedDifficulty =
                                        selectedDifficulty == difficulty
                                        ? nil : difficulty
                                }
                            }
                        }
                    }
                    
                    PreferenceCard(
                        title: "Main Ingredient",
                        bgColor: Color.AppTheme.lightBlue,
                        bgImageName: "IngredientAsset"
                    ) {
                        HStack(spacing: 10) {
                            ForEach(ingredients, id: \.self) { ingredient in
                                SelectionButton(
                                    text: ingredient.rawValue,
                                    bgColor: Color.AppTheme.darkBlue,
                                    isSelected: selectedIngredient == ingredient
                                ) {
                                    selectedIngredient =
                                        selectedIngredient == ingredient
                                        ? nil : ingredient
                                }
                            }
                        }
                    }
                    
                    PreferenceCard(
                        title: "Taste Profile",
                        bgColor: Color.AppTheme.lightGreen,
                        bgImageName: "TasteAsset"
                    ) {
                        HStack(spacing: 10) {
                            ForEach(tastes, id: \.self) { taste in
                                SelectionButton(
                                    text: taste.rawValue,
                                    bgColor: Color.AppTheme.darkGreen,
                                    isSelected: selectedTaste == taste
                                ) {
                                    selectedTaste =
                                        selectedTaste == taste ? nil : taste
                                }
                            }
                        }

                    }

                    Spacer()

                    MainButton("Generate Menu", iconName: "bookmark.fill") {
                        if let result = RecipeGenerator.generate(
                            taste: selectedTaste,
                            difficulty: selectedDifficulty,
                            ingredient: selectedIngredient
                        ) {
                            generatedRecipe = result
                        } else {
                            showErrorAlert = true
                        }
                    }
                }
                .padding(16)
            }
            .background(Color.AppTheme.mainBackground.ignoresSafeArea())
            .navigationDestination(item: $generatedRecipe) {
                recipe in
                RecipeView(entry: recipe)
            }
            .alert("No Recipe Found", isPresented: $showErrorAlert) {
                Button("Got it", role: .cancel) {}
            } message: {
                Text(
                    "There are no combinations available yet. Please select another set of preferences."
                )
            }
        }
    }
}

#Preview {
    GeneratorView()
}
