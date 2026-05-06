//
//  RecipeSchema.swift
//  GA
//
//  Created by Dimas Putra Aryawan on 30/04/26.
//

import SwiftData
import SwiftUI

struct RecipeModel: Identifiable, Hashable, Codable {
    let id: Int
    let title: String
    let ingredients: [Ingredient]
    let directions: [String]
    let tasteProfile: TasteProfile
    let difficulty: Difficulty
    let mainIngredient: MainIngredient
    let link: String?
    let imageLink: String?
}

struct Ingredient: Hashable, Codable {
    let name: String
    let measurement: String
    let alternative: String?
    let alternativeMeasurement: String?
}

@Model
class BookmarkedRecipeID {
    @Attribute(.unique) var id: Int

    init(id: Int) {
        self.id = id
    }
}
enum TasteProfile: String, CaseIterable, Codable {
    case savory = "savory"
    case sweet = "sweet"
    case spicy = "spicy"

    var displayName: String {
        return self.rawValue.capitalized
    }
}

enum Difficulty: String, CaseIterable, Codable {
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"

    var displayName: String {
        return self.rawValue.capitalized
    }
}

enum MainIngredient: String, CaseIterable, Codable {
    case chicken = "chicken"
    case beef = "beef"
    case egg = "egg"

    var displayName: String {
        return self.rawValue.capitalized
    }
}
