//
//  RecipeSchema.swift
//  GA
//
//  Created by Dimas Putra Aryawan on 30/04/26.
//

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

//struct SampleData {
//    static let recipes: [RecipeModel] = [
//        RecipeModel(
//            id: 0,
//            title: "Ground Beef Casserole",
//            ingredients: [
//                Ingredient(
//                    name: "ground beef",
//                    measurement: "",
//                    alternative: nil,
//                    alternativeMeasurement: nil
//                ),
//                Ingredient(
//                    name: "potatoes",
//                    measurement: "",
//                    alternative: nil,
//                    alternativeMeasurement: nil
//                ),
//                Ingredient(
//                    name: "cream of mushroom soup",
//                    measurement: "",
//                    alternative:
//                        "homemade mushroom sauce (flour + mushroom + milk)",
//                    alternativeMeasurement: "1 cup"
//                ),
//                Ingredient(
//                    name: "Velveeta cheese",
//                    measurement: "",
//                    alternative: "cheddar cheese, melted",
//                    alternativeMeasurement: "4 slices"
//                ),
//                Ingredient(
//                    name: "Canned Biscuits",
//                    measurement: "",
//                    alternative: nil,
//                    alternativeMeasurement: nil
//                ),
//            ],
//            directions: [
//                "Brown meat with onion, place in bottom of casserole dish. Place cooked potatoes on top of meat.",
//                "Place cheese on top of potatoes.",
//                "Pour mushroom soup over mixture.",
//                "Separate biscuits and place biscuits on top.",
//                "Cook until biscuits are brown and casserole is hot and bubbly.",
//            ],
//            tasteProfile: .savory,
//            difficulty: .easy,
//            mainIngredient: .beef,
//            link: "www.cookbooks.com/Recipe-Details.aspx?id=279193",
//            imageLink:
//                "https://www.wellplated.com/wp-content/uploads/2023/03/Best-Ground-Beef-Casserole.jpg"
//        ),
//        RecipeModel(
//            id: 1,
//            title: "Creamy Beef And Macaroni Whip-Up",
//            ingredients: [
//                Ingredient(
//                    name: "ground beef",
//                    measurement: "1 lb.",
//                    alternative: nil,
//                    alternativeMeasurement: nil
//                ),
//                Ingredient(
//                    name: "macaroni noodles",
//                    measurement: "7 oz.",
//                    alternative: nil,
//                    alternativeMeasurement: nil
//                ),
//                Ingredient(
//                    name: "spaghetti sauce",
//                    measurement: "32 oz.",
//                    alternative: nil,
//                    alternativeMeasurement: nil
//                ),
//                Ingredient(
//                    name: "mayonnaise",
//                    measurement: "1 1/2 c.",
//                    alternative: "Greek yogurt",
//                    alternativeMeasurement: "1 1/2 c."
//                ),
//                Ingredient(
//                    name: "Cheddar cheese",
//                    measurement: "",
//                    alternative: nil,
//                    alternativeMeasurement: nil
//                ),
//            ],
//            directions: [
//                "Brown ground beef in a big pan.",
//                "Boil noodles in a pot.",
//                "Mix noodles, spaghetti sauce and mayonnaise in with ground beef. Stir.",
//                "Sprinkle on desired amount of cheese.",
//                "Serve.",
//            ],
//            tasteProfile: .savory,
//            difficulty: .easy,
//            mainIngredient: .beef,
//            link: "www.cookbooks.com/Recipe-Details.aspx?id=958419",
//            imageLink:
//                "https://therecipelife.com/wp-content/uploads/2024/12/Creamy-Beef-and-Bowtie-Pasta-12-768x1024.jpg"
//        ),
//    ]
//}
