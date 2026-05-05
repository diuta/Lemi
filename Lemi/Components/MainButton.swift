//
//  BottomActionBarView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct MainButton: View {

    let title: String
    let iconName: String?
    let action: () -> Void

    init(_ title: String, iconName: String? = nil, action: @escaping () -> Void)
    {
        self.title = title
        self.iconName = iconName
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                if let icon = iconName {
                    Image(systemName: icon)
                        .font(.AppTheme.sectionTitle)
                }

                Text(title)
            }
            .font(.AppTheme.sectionTitle)
            .foregroundColor(Color.AppTheme.darkerYellow)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.AppTheme.normalYellow)
            .clipShape(Capsule())
            .shadow(
                color: Color.AppTheme.darkYellow,
                radius: 0,
                x: 0,
                y: 4
            )
            .overlay(
                Capsule()
                    .stroke(Color.AppTheme.darkYellow, lineWidth: 4)
            )
        }
    }
}

#Preview {
    MainButton("DAMN", iconName: "bookmark.fill") {
        print("lmao")
    }
}
