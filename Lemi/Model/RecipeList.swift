//
//  RecipeList.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 03/05/26.
//

import Foundation

@Observable
class RecipeStore {
    static let shared = RecipeStore()
    
    var recipes: [RecipeModel] = []

    init() {
        loadRecipes()
    }

    private func loadRecipes() {
        guard
            let url = Bundle.main.url(
                forResource: "RecipeList",
                withExtension: "json"
            ),
            let data = try? Data(contentsOf: url)
        else {
            print("Could not find or read RecipeList.json")
            return
        }

        recipes = RecipeService.decodeRecipes(from: data)
    }
}
