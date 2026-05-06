//
//  CustomRecipeTabPicker.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 05/05/26.
//

import SwiftUI

struct CustomRecipeTabPicker: View {
    @Binding var selectedTab: String
    
    let tabs = ["Ingredients", "Steps", "More Like This"]
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                Text(tab)
                    .font(selectedTab == tab ? Font.AppTheme.content : Font.AppTheme.regularContent)
                    
                    
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background {
                        if selectedTab == tab {
                            Capsule()
                                .fill(Color.AppTheme.normalYellow)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = tab
                        }
                    }
            }
        }
        .padding(4)
        .background(Color.gray.opacity(0.15))
        .clipShape(Capsule())
    }
}

#Preview {
    CustomRecipeTabPicker(selectedTab: .constant("Ingredients"))
        .padding()
}
