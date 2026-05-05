//
//  HomeView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 05/05/26.
//

import SwiftUI

struct HomeView: View {
    let entry: RecipeModel
    @State private var selectedTab = "Steps"
    var body: some View {
        VStack(alignment:.leading, spacing: 20){
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Your Next meal")
                        .font(.title)
                    Text("Starts Here!")
                        .font(.title.bold())
                }
                
                HStack (spacing: 4){
                    Text("All your saved recipes, ready t cook with")
                    Text("LEMI.")
                        .bold()
                }
            }
            Picker("Pilih Tab", selection: $selectedTab) {
                Text("New Added").tag("New")
                Text("All").tag("All")
            }
            .pickerStyle(.segmented)
            
            ScrollView(.vertical) {
                if selectedTab == "Ingredients" {
                    CardMenu(entry: entry)
                } else if selectedTab == "Steps" {
                    CardMenu(entry: entry)
                } else {
                    MoreLikeThis(entry: entry)
                }
            }
            ActionBar()


        }
        //.safeAreaPadding(10)
        .padding(20)
        
    }
}

#Preview {
    HomeView(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
}
