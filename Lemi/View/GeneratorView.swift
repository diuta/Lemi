//
//  GeneratorView.swift
//  Lemi
//
//  Created by Clement N on 30/04/26.
//

import SwiftUI



struct GeneratorView: View {
    @State private var selectedDifficulty: String? = nil
    @State private var selectedIngredient: String? = nil
    @State private var selectedTaste: String? = nil
    @State private var generatedRecipe: RecipeModel? = nil
    @State private var showErrorAlert: Bool = false
    
    let difficulties = ["Easy", "Medium", "Hard"]
    let ingredients = ["Chicken", "Beef", "Egg"]
    let tastes = ["Savory", "Sweet", "Spicy"]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Choose your ...")
                    .font(Font.AppTheme.screenTitle)
                    .foregroundColor(Color.AppTheme.textPrimary)
                    .padding()
                VStack(spacing: 15) {
                    SectionCard(title: "Difficulty", bgColor: Color.AppTheme.pinkCard) {
                        HStack(spacing: 5) {
                            ForEach(difficulties, id: \.self) { difficulty in
                                PillView(text: difficulty, bgColor: Color.AppTheme.pinkPill, isSelected: selectedDifficulty == difficulty) {
                                    selectedDifficulty = selectedDifficulty == difficulty ? nil : difficulty
                                }
                            }
                        }
                        
                    }
                    SectionCard(title: "Main Ingredient", bgColor: Color.AppTheme.blueCard) {
                        HStack(spacing: 5) {
                            ForEach(ingredients, id: \.self) { ingredient in
                                PillView(text: ingredient, bgColor: Color.AppTheme.bluePill, isSelected: selectedIngredient == ingredient) {
                                    selectedIngredient = selectedIngredient == ingredient ? nil : ingredient
                                }
                            }
                        }
                        
                    }
                    SectionCard(title: "Taste Profile", bgColor: Color.AppTheme.greenCard) {
                        HStack(spacing: 5) {
                            ForEach(tastes, id: \.self) { taste in PillView(text: taste, bgColor: Color.AppTheme.greenPill, isSelected: selectedTaste == taste) {
                                selectedTaste = selectedTaste == taste ? nil : taste
                            }
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        let tasteEnum = TasteProfile(rawValue: selectedTaste ?? "")
                        let difficultyEnum = Difficulty(rawValue: selectedDifficulty ?? "")
                        let ingredientEnum = MainIngredient(rawValue: selectedIngredient ?? "")
                        
                        if let result = RecipeGenerator.generate(taste: tasteEnum, difficulty: difficultyEnum, ingredient: ingredientEnum) {
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
                recipe in RecipeView(entry: recipe, otherRecipes: SampleData.recipes)
            }
            .alert("No Recipe Found", isPresented: $showErrorAlert) {
                Button("Got it", role: .cancel) { }
            } message: {
                Text("There are no combinations available yet. Please select another set of preferences.")
            }
            
        }
    }
}




#Preview {
    GeneratorView()
}
