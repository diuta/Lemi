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
                    SectionCard(
                        title: "Difficulty",
                        bgColor: Color.AppTheme.pinkCard
                    ) {
                        HStack(spacing: 5) {
                            ForEach(difficulties, id: \.self) { difficulty in
                                SelectionPill(
                                    text: difficulty.rawValue,
                                    bgColor: Color.AppTheme.pinkPill,
                                    isSelected: selectedDifficulty == difficulty
                                ) {
                                    selectedDifficulty =
                                        selectedDifficulty == difficulty
                                        ? nil : difficulty
                                }
                            }
                        }

                    }
                    SectionCard(
                        title: "Main Ingredient",
                        bgColor: Color.AppTheme.blueCard
                    ) {
                        HStack(spacing: 5) {
                            ForEach(ingredients, id: \.self) { ingredient in
                                SelectionPill(
                                    text: ingredient.rawValue,
                                    bgColor: Color.AppTheme.bluePill,
                                    isSelected: selectedIngredient == ingredient
                                ) {
                                    selectedIngredient =
                                        selectedIngredient == ingredient
                                        ? nil : ingredient
                                }
                            }
                        }

                    }
                    SectionCard(
                        title: "Taste Profile",
                        bgColor: Color.AppTheme.greenCard
                    ) {
                        HStack(spacing: 5) {
                            ForEach(tastes, id: \.self) { taste in
                                SelectionPill(
                                    text: taste.rawValue,
                                    bgColor: Color.AppTheme.greenPill,
                                    isSelected: selectedTaste == taste
                                ) {
                                    selectedTaste =
                                        selectedTaste == taste ? nil : taste
                                }
                            }
                        }

                    }

                    Spacer()

                    Button(action: {
                        if let result = RecipeGenerator.generate(
                            taste: selectedTaste,
                            difficulty: selectedDifficulty,
                            ingredient: selectedIngredient
                        ) {
                            generatedRecipe = result
                        } else {
                            showErrorAlert = true
                        }
                    }) {
                        Text("Generate")
                            .font(.AppTheme.buttonText)
                            .foregroundColor(.AppTheme.textPrimary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.AppTheme.actionButton)
                            .clipShape(Capsule())
                    }
                    .padding(.bottom, 10)
                }
                .padding(16)
            }
            .background(Color.AppTheme.mainBackground.ignoresSafeArea())
            .navigationDestination(item: $generatedRecipe) {
                recipe in
                RecipeView(entry: recipe, otherRecipes: SampleData.recipes)
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
