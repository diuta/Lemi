//
//  PreferenceEnums.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 02/05/26.
//

enum TasteProfile: String, CaseIterable {
    case savory = "Savory"
    case sweet = "Sweet"
    case spicy = "Spicy"
}

enum Difficulty: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

enum MainIngredient: String, CaseIterable {
    case chicken = "Chicken"
    case beef = "Beef"
    case egg = "Egg"
}
