//
//  SectionCard.swift
//  Lemi
//
//  Created by Clement N on 02/05/26.
//

import SwiftUI

struct SectionCard<Content: View>: View {
    
    var title: String
    var bgColor: Color

    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(Font.AppTheme.sectionHeader)
                .foregroundColor(Color.AppTheme.textSecondary)

            content
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(bgColor)
        .cornerRadius(20)
    }

}

#Preview {
    SectionCard(title: "Sample Section", bgColor: .blue) {
        Text("Content goes here")
            .foregroundColor(.white)
    }
    .padding()
}
