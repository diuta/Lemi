//
//  CardMenu.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 05/05/26.
//

import SwiftUI

struct CardMenu: View {

    let entry: RecipeModel

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            let url = URL(string: entry.imageLink ?? "")

            AsyncImage(url: url) {
                image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 225)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 225)
                    .overlay { ProgressView() }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(entry.title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color.AppTheme.textPrimary)
                .multilineTextAlignment(.leading)

            LabelPreference(entry: entry)
                .frame(width: 280)

        }
        .padding(16)
        .background(Color.AppTheme.lightYellow)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
    }

}

struct FallbackThumbnail: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.gray.opacity(0.2))
            .frame(width: 70, height: 70)
            .overlay(
                Image(systemName: "fork.knife")
                    .foregroundColor(.gray)
            )
    }
}

#Preview {
    CardMenu(
        entry: RecipeDataLoader.decodeRecipes().first!
    )

}
