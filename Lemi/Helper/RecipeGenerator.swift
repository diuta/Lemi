//
//  RecipeGenerator.swift
//  Lemi
//
//  Created by Clement N on 02/05/26.
//

import Foundation

struct RecipeGenerator {
    static func generate(
        taste: TasteProfile?,
        difficulty: Difficulty?,
        ingredient: MainIngredient?
        
    ) -> RecipeModel? {
        let resolvedTaste = taste ?? TasteProfile.allCases.randomElement()!
        let resolvedDifficulty = difficulty ?? Difficulty.allCases.randomElement()!
        let resolvedIngredient = ingredient ?? MainIngredient.allCases.randomElement()!
        
        let matchingRecipes = SampleData.recipes.filter {
            recipe in
            recipe.tasteProfile == resolvedTaste &&
            recipe.difficulty == resolvedDifficulty &&
            recipe.mainIngredient == resolvedIngredient
        }
        
        return matchingRecipes.randomElement()
            
    }
    
    
}
