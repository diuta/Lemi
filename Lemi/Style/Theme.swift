//
//  Theme.swift
//  Lemi
//
//  Created by Clement N on 02/05/26.
//

import Foundation
import SwiftUI

extension Color {
    struct AppTheme {
        // Background
        static let mainBackground = Color(red: 0.96, green: 0.96, blue: 0.94)  // Soft off-white

        // Difficulty (Pink)
        static let lightPink = Color(red: 1.0, green: 0.53, blue: 0.76)
        static let darkPink = Color(red: 0.82, green: 0.42, blue: 0.62)  // Darker pink for pills

        // Main Ingredient (Blue)
        static let lightBlue = Color(red: 0.05, green: 0.53, blue: 0.92)
        static let darkBlue = Color(red: 0.03, green: 0.40, blue: 0.72)  // Darker blue for pills

        // Taste Profile (Green)
        static let lightGreen = Color(red: 0.07, green: 0.68, blue: 0.26)
        static let darkGreen = Color(red: 0.05, green: 0.48, blue: 0.18)  // Darker green for pills

        static let normalYellow = Color(hex: "#FFCC23")
        static let darkYellow = Color(hex: "#BF991A")
        static let darkerYellow = Color(hex: "#59470C")

        // Text Colors
        static let textPrimary = Color.black
        static let textSecondary = Color.white
    }
}

extension Font {
    struct AppTheme {
        /// Used for the main "Choose your ..." header
        static let screenTitle = Font.system(
            size: 32,
            weight: .bold,
            design: .default
        )

        /// Used for card titles like "Difficulty", "Main Ingredient"
        static let sectionHeader = Font.system(
            size: 18,
            weight: .bold,
            design: .default
        )
        
        /// Used for the main action button ("Generate")
        static let buttonText = Font.system(
            size: 18,
            weight: .bold,
            design: .default
        )
        
        static let ingredientName = Font.system(
            size: 16,
            weight: .medium,
            design: .default
        )
        
        static let ingredientMeasurement = Font.system(
            size: 16,
            weight: .semibold,
            design: .default
        )
        
        /// Used for the text inside the selectable pills
        static let pillText = Font.system(
            size: 16,
            weight: .bold,
            design: .default
        )
    }
}
