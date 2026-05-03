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
        
        let recipes: [RecipeModel] = RecipeDataLoader.decodeRecipes()
        
        return recipes.filter { recipe in
            (taste == nil || recipe.tasteProfile == taste)
                && (difficulty == nil || recipe.difficulty == difficulty)
                && (ingredient == nil || recipe.mainIngredient == ingredient)
        }.randomElement()
    }
}

struct MoreLikeThisGenerator {
    static func generate(
        currRecipe : RecipeModel,
    ) -> [RecipeModel] {
        
        let recipes: [RecipeModel] = RecipeDataLoader.decodeRecipes()
        let filtered = recipes.filter { $0.id != currRecipe.id }
        let exactMatch = filtered.filter {
            $0.tasteProfile == currRecipe.tasteProfile &&
            $0.difficulty == currRecipe.difficulty &&
            $0.mainIngredient == currRecipe.mainIngredient
        }

        return Array(exactMatch.shuffled().prefix(5))
    }
}
