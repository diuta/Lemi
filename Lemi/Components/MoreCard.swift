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
            AsyncImage(
                url: URL(
                    string: entry.imageLink ?? ""
                )
            ) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 3))
            .clipped()

            VStack {
                Text(entry.title)
                    .font(.system(size: 13, weight: .bold))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
            }
            .frame(height: 40)

        }
        .padding(10)
        .frame(width: 100, height: 158, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(red: 0.87, green: 0.94, blue: 0.92))
        )

    }
}

#Preview {
    MoreCard(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
}
