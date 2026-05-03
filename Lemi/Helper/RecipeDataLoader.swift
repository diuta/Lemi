//
//  RecipeList.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 03/05/26.
//

import Foundation

struct RecipeDataLoader {
    static func decodeRecipes() -> [RecipeModel] {
        guard
            let url = Bundle.main.url(forResource: "RecipeData", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else { return [] }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let recipes = try decoder.decode([RecipeModel].self, from: data)
            return recipes
        } catch {
            print("Failed to decode JSON: \(error)")
            return []
        }
    }
}
