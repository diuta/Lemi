//
//  PreferenceEnums.swift
//  Lemi
//
//  Created by Dimas Putra Aryawan on 02/05/26.
//

import Foundation

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
