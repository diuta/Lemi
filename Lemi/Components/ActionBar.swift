//
//  BottomActionBarView.swift
//  Lemi
//
//  Created by Ananda Rachmawati Purwanto on 01/05/26.
//

import SwiftUI

struct ActionBar: View {
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                print("Start Cooking!")
            }) {
                Text("Start Cooking")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.yellow)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3)
            }
            
            Button(action: {
            }) {
                Image(systemName: "shuffle")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 3)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
//        .background(.red)
    }
}

#Preview {
    ActionBar()
}
