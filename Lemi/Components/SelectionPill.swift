//
//  PillView.swift
//  Lemi
//
//  Created by Clement N on 02/05/26.
//

import SwiftUI

struct SelectionPill: View {
    var text: String
    var bgColor: Color
    var isSelected: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(Font.AppTheme.pillText)
                .foregroundColor(
                    isSelected ? bgColor : Color.AppTheme.textSecondary
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(isSelected ? Color.AppTheme.textSecondary : bgColor)
                .clipShape(Capsule())
                .animation(.easeInOut(duration: 0.2), value: isSelected)

        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack {
        SelectionPill(text: "Selected", bgColor: .pink, isSelected: true) {}
        SelectionPill(text: "Unselected", bgColor: .pink, isSelected: false) {}
    }
    .padding()
}
