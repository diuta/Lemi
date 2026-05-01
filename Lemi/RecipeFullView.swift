//
//  RecipeFullView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct RecipeFullView: View {
    let entry: RecipeModel
    @State private var selectedTab = "Steps"
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack() { // ZStack biar tombol kuning bisa melayang di bawah
                
                VStack(spacing: 20) {
                    AsyncImage(url: URL(string: entry.imageLink ?? "https://cdn.britannica.com/98/235798-050-3C3BA15D/Hamburger-and-french-fries-paper-box.jpg")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .padding(.horizontal, 20) // Taruh padding DI BAWAH clipShape
                    // .background(Color(.secondarySystemBackground))
                    
                    // Gambar makanan besar
                    Text(entry.title)
                    //.frame(height: 250)
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.7)
                        .padding(.horizontal, 20)
                    // .background(Color(.secondarySystemBackground))
                    
                    //                        CustomTabSwitcher(selectedTab: $selectedTab)
                    Picker("Pilih Tab", selection: $selectedTab) {
                        Text("Ingredients").tag("Ingredients")
                        Text("Steps").tag("Steps")
                        Text("More Like This").tag("More Like This")
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 20)
                    
                    ScrollView(.vertical){
                        if selectedTab == "Ingredients" {
                            //IngredientsView(entry: entry)
                        } else if selectedTab == "Steps" {
                            StepView(entry: entry)
                        } else {
                            ZStack{
                                Rectangle()
                                    .fill(Color.green)
                                ScrollView(.horizontal, showsIndicators: false){
                                    //jadiin for each buat more like this
                                    HStack(){
                                        MoreCard(entry: entry)
                                        MoreCard(entry: entry)
                                        MoreCard(entry: entry)
                                        MoreCard(entry: entry)
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 16)
                                }
                                .overlay(alignment: .leading) {
                                    Rectangle()
                                        .fill(Color.green)
                                        .frame(width: 10)
                                }
                                .overlay(alignment: .trailing) {
                                    Rectangle()
                                        .fill(Color.green)
                                        .frame(width: 10)
                                }
                                
                            }
                            .frame(height: 190)
                            .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
                            .padding(.horizontal, 20)
                        }
                    }
                    
                }
                
                // 4. BOTTOM ACTION BAR (Start Cooking & Shuffle)
                BottomActionBarView()
                    //.ignoresSafeArea(.bottom)
            }
            .safeAreaPadding(10)
            .navigationBarTitleDisplayMode(.inline) // Posisi judul jadi di tengah
            .toolbar {
                // Tombol Panah Kiri (Back)
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                }
                
                // Judul Resep di Tengah
                ToolbarItem(placement: .principal) {
                    Text(String("\(entry.tasteProfile) \(entry.mainIngredient) \(entry.difficulty)".capitalized))
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)
                }
            }
        }
    }
}
//struct CustomTabSwitcher: View {
//    @Binding var selectedTab: String
//
//    let tabs = ["Ingredients", "Steps", "More Like This"]
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(tabs, id: \.self) { tab in
//                Button(action: {
//                    // Kalau di klik, animasi pindah tab
//                    withAnimation {
//                        selectedTab = tab
//                    }
//                }) {
//                    Text(tab)
//                        .font(.system(size: 13, weight: .semibold))
//                        .foregroundColor(selectedTab == tab ? .black : .gray) // Warna teks berubah
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 10)
//                        .background(
//                            // Bikin pill putih kalau lagi dipilih
//                            RoundedRectangle(cornerRadius: 20)
//                                .fill(selectedTab == tab ? Color.white : Color.clear)
//                                .shadow(color: selectedTab == tab ? Color.black.opacity(0.1) : Color.clear, radius: 2, x: 0, y: 1)
//                        )
//                }
//            }
//        }
//        .padding(4)
//        .background(Color(red: 0.95, green: 0.95, blue: 0.95)) // Warna abu-abu background tab
//        .clipShape(RoundedRectangle(cornerRadius: 25))
//        .padding(.horizontal, 20)
//    }
//}
#Preview {
    RecipeFullView(entry: RecipeModel(
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
