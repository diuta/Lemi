//
//  MoreCard.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI
struct MoreCard: View {
    let entry: RecipeModel
    var body: some View {
        VStack(spacing: 11) {
            AsyncImage(url: URL(string: entry.imageLink ?? "https://cdn.britannica.com/98/235798-050-3C3BA15D/Hamburger-and-french-fries-paper-box.jpg")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .clipped()

            Text(entry.title)
                .font(.system(size: 13, weight: .bold))
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)

        }
        .padding(10)
        .frame(width: 100, height: 158)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.green, lineWidth: 1)
        )
        .padding(5)

    }
}

#Preview {
    MoreCard(entry: RecipeModel(
        title: "Stir-Fried Beef with Green Beans and Peanut Sauce",
        ingredients: [
            "14 cup flour", "pepper", "8 chicken thighs or 4 chicken breasts",
            "2 tablespoons oil", "1 onion, chopped", "4 minced fresh garlic cloves",
            "2 smoked sausage, sliced", "2 stalks celery, chopped",
            "2 teaspoons cajun seasoning", "1 (19 ounce) can tomatoes",
            "1 green bell pepper, chopped", "2 green onions (for garnish)"
        ],
        directions: [
            "In a plastic bag, combine the flour and pepper.",
            "Add the chicken; shake to coat.",
            "Reserve the remaining flour mixture.",
            "In a skillet, heat oil over med-high heat; brown the chicken on all sides (about 10 minutes).",
            "Remove to plate; set aside.",
            "Add the chopped onion and garlic to the same skillet; cook over medium heat for about 3 minutes.",
            "Add sausages, celery and seasoning; cook for 1-5 minutes, or until veggies are tender.",
            "Add the reserved flour mixture.",
            "Stir in tomatoes, (mashing slightly with a fork) and the bell pepper; bring to a boil.",
            "Return chicken to pan; reduce heat.",
            "Cover and simmer, stirring occasionally, for about 35 minutes, or until the chicken is fully cooked.",
            "Serve garnished with green onions."
        ],
        ner: [
            "flour", "pepper", "chicken", "oil", "onion", "fresh garlic",
            "sausage", "stalks celery", "cajun seasoning", "tomatoes",
            "green bell pepper", "green onions"
        ],
        tasteProfile: .savory,
        difficulty: .hard,
        mainIngredient: .chicken,
        imageLink: nil
        )
    )
}
