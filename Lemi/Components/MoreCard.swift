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
            .frame(width: 89, height: 89)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .clipped()

            VStack {
                Text(entry.title)
                    .font(.system(size: 13, weight: .bold))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.7)
                    .foregroundColor(Color.AppTheme.darkerYellow)
            }
            .frame(height: 40)

        }
        .padding(10)
        .frame(width: 114, height: 158, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.AppTheme.normalYellow)
        )

    }
}

#Preview {
    MoreCard(
        entry: RecipeDataLoader.decodeRecipes().first!
    )
}
