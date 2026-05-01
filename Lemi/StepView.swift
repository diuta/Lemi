//
//  StepView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct StepView: View {
    let entry: RecipeModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 5) {
                ForEach(Array(entry.directions.enumerated()), id: \.element) { index, d in
                    HStack(spacing: 16) {
                        ZStack{
                            Circle()
                                .fill(Color(.systemGreen))
                                .frame(width: 48, height: 48)
                            Text("\(index+1)")
                                .font(.system(size: 19, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 4)
                        .padding(.bottom, 4)
                        
                        Text(d)
                            .font(Font.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(Color(red: 217/255, green: 236/255, blue: 250/255))
                                    .frame(height: 1.5)
                            }
                        
                    }
                    .padding(.horizontal, 20)
                    //.background(Color.blue)

                }
            }
            .padding(.vertical, 10)
        }
    }
}


#Preview {
    StepView(entry: RecipeModel(
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
