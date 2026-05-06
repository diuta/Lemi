//
//  PillView.swift
//  Lemi
//
//  Created by Clement N on 02/05/26.
//

import SwiftUI

struct SelectionButton: View {

    var text: String
    var bgColor: Color
    var isSelected: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            if isSelected {
                SelectedView(text: text, bgColor: bgColor)
            } else {
                DefaultView(text: text, bgColor: bgColor)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}

struct SelectedView: View {

    var text: String
    var bgColor: Color

    var body: some View {
        Text(text)
            .font(Font.AppTheme.content)
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            .foregroundColor(
                bgColor
            )
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.AppTheme.mainBackground)
            .clipShape(Capsule())
            .shadow(
                color: bgColor,
                radius: 0,
                x: 3,
                y: 5
            )
            .overlay(
                Capsule()
                    .stroke(bgColor, lineWidth: 4)
            )
    }
}

struct DefaultView: View {

    var text: String
    var bgColor: Color

    var body: some View {
        Text(text)
            .font(Font.AppTheme.content)
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            .foregroundColor(
                .AppTheme.mainBackground
            )
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(bgColor)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(bgColor, lineWidth: 4)
            )
    }
}

#Preview {
    VStack {
        SelectionButton(text: "Selected", bgColor: .pink, isSelected: true) {}
        SelectionButton(text: "Unselected", bgColor: .pink, isSelected: false) {
        }
    }
    .padding()
}
