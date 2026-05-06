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
        static let mainBackground = Color(hex: "#FFFFF7")

        static let activePink = Color(hex: "#CC6DA6")
        static let normalPink = Color(hex: "#FF88CF")
        static let darkPink = Color(hex: "#CC6DA6")

        static let activeBlue = Color(hex: "#D9ECFA")
        static let normalBlue = Color(hex: "#0176CA")
        static let darkBlue = Color(hex: "#0162A8")

        static let normalGreen = Color(hex: "#00AF47")
        static let darkGreen = Color(hex: "#008335")

        static let activeYellow = Color(hex: "#FFEFBB")
        static let normalYellow = Color(hex: "#FFCC23")
        static let darkYellow = Color(hex: "#BF991A")
        static let darkerYellow = Color(hex: "#59470C")

        static let textPrimary = Color(hex: "#151515")
        static let textSecondary = Color(hex: "#FFFFF7")
    }
}

extension Font {
    struct AppTheme {
        static let screenTitle = Font.system(
            size: 40,
            weight: .bold,
            design: .default
        )

        static let sectionHeader = Font.system(
            size: 24,
            weight: .bold,
            design: .default
        )

        static let sectionTitle = Font.system(
            size: 18,
            weight: .bold,
            design: .default
        )

        static let regular = Font.system(
            size: 16,
            weight: .regular,
            design: .default
        )

        static let boldRegular = Font.system(
            size: 16,
            weight: .bold,
            design: .default
        )

        static let content = Font.system(
            size: 14,
            weight: .bold,
            design: .default
        )

        static let caption = Font.system(
            size: 11,
            weight: .regular,
            design: .default
        )
        .italic()
    }
}
