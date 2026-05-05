//
//  SectionCard.swift
//  Lemi
//
//  Created by Clement N on 02/05/26.
//

import SwiftUI

struct PreferenceCard<Content: View>: View {

    var title: String
    var bgColor: Color
    var bgImageName: String

    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(Font.AppTheme.sectionHeader)
                .foregroundColor(Color.AppTheme.textSecondary)

            Spacer()

            content
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 195, alignment: .leading)
        .background(
            Image(bgImageName)
                .resizable()
                .scaledToFill()
        )
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .contentShape(RoundedRectangle(cornerRadius: 20))
    }

}

#Preview {
    PreferenceCard(
        title: "Sample Section",
        bgColor: .blue,
        bgImageName: "IngredientAsset"
    ) {
        Text("Content goes here")
            .foregroundColor(.white)
    }
    .padding()
}
