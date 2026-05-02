//
//  RecipeSchema.swift
//  GA
//
//  Created by Dimas Putra Aryawan on 30/04/26.
//

import SwiftUI

struct RecipeModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let ingredients: [String]
    let directions: [String]
    let ner: [String]
    let tasteProfile: TasteProfile
    let difficulty: Difficulty
    let mainIngredient: MainIngredient
    let imageLink: String?
}

// MARK: Dummy Data
enum SampleData {
    static let recipes: [RecipeModel] = [
        RecipeModel(
            title: "Braised chicken",
            ingredients: [
                "1 1/2 kg chicken", "1 tbsp each salt and pepper",
                "5 tbsp olive oil",
                "1 tbsp dried Rosemary", "1 tbsp dried thyme",
                "1 chopped parsley",
                "1 onion, chopped", "1 red bell pepper chopped",
                "1 celery chopped",
                "6 garlic cloves", "1 chicken stock", "1 chopped tomatoes",
                "1 tomato paste", "1/2 potatoes chopped", "1 peas",
            ],
            directions: [
                "Take a large pan.",
                "Add chicken to the oil and brown both sides",
                "Then add dried rosemary and thyme",
                "Add the rest of the vegetables and mix well",
                "Mix tomato paste with some chicken broth and put it in the pan",
                "Put the lid on the pan and let it cook for 35 minutes.... Keep adding broth so that it doesnt dry up",
                "Serve with beard and enjoy :)",
            ],
            ner: [
                "chicken", "salt", "olive oil", "Rosemary", "thyme", "parsley",
                "onion", "red bell pepper", "celery", "garlic", "chicken",
                "tomatoes", "tomato", "potatoes", "peas",
            ],
            tasteProfile: .savory,
            difficulty: .hard,
            mainIngredient: .chicken,
            imageLink:
                "https://cdn.britannica.com/98/235798-050-3C3BA15D/Hamburger-and-french-fries-paper-box.jpg"
        ),

        RecipeModel(
            title: "Guppy's Chicken Noodle Soup",
            ingredients: [
                "1 whole chicken", "1 large yellow onion, chopped",
                "1 bunch celery, chopped",
                "3 (15 ounce) cans chicken broth", "12 cup parsley flakes",
                "4 garlic cloves, minced",
                "1 tablespoon black pepper", "14 cup chicken bouillon granule",
                "1 tablespoon sea salt",
                "1.5 (32 ounce) packages yolk-free wide egg noodles",
                "12 cup butter",
            ],
            directions: [
                "Place chicken in stock pot, fill with water until chicken is covered; On high heat, boil chicken until cooked completely.",
                "Usually 30-45 minutes.",
                "Remove chicken (do not discard water).",
                "In the stockpot, add onion, celery, chicken broth, parsley flakes, garlic, pepper, chicken boullion and salt to water; turn to low heat.",
                "Remove skin from chicken and de-bone chicken.",
                "Shred chicken into bite size pieces; add to stockpot.",
                "Let simmer for 30 minutes.",
                "Add noodles and butter, cook until noodles are soft.",
                "About 15 minutes.",
                "Serve.",
            ],
            ner: [
                "chicken", "yellow onion", "celery", "chicken broth",
                "parsley flakes",
                "garlic", "black pepper", "chicken bouillon granule", "salt",
                "egg noodles", "butter",
            ],
            tasteProfile: .savory,
            difficulty: .hard,
            mainIngredient: .chicken,
            imageLink: nil
        ),
    ]
}
