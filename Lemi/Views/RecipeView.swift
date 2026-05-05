//
//  RecipeFullView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct RecipeView: View {
    
    let entry: RecipeModel
    init(entry: RecipeModel) {
        self.entry = entry
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.systemYellow
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    @State private var selectedTab = "Steps"
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: entry.imageLink ?? "")) {
                    image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(width: 370, height: 250)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                        .overlay { ProgressView() }
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                
                Text(entry.title)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                
                Picker("Pilih Tab", selection: $selectedTab) {
                    Text("Ingredients").tag("Ingredients")
                    Text("Steps").tag("Steps")
                    Text("More Like This").tag("More Like This")
                }
                .pickerStyle(.segmented)
                
                ScrollView(.vertical) {
                    if selectedTab == "Ingredients" {
                        IngredientList(entry: entry)
                    } else if selectedTab == "Steps" {
                        RecipeStepsSection(entry: entry)
                    } else {
                        MoreSection(entry: entry)
                    }
                }
                MainButton("Add to List", iconName: "plus.app.fill") {
                    print("damn")
                }
            }
            .padding(.horizontal, 20)
        }
        .safeAreaPadding(10)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(
                    String(
                        "\(entry.tasteProfile) \(entry.mainIngredient) \(entry.difficulty)"
                            .capitalized
                    )
                )
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.AppTheme.textPrimary)
            }
        }
        
    }
}

#Preview {
    RecipeView(
        entry: RecipeDataLoader.decodeRecipes()[3]
    )
}
