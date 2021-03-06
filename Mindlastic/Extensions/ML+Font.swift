//
//  ML+Font.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation
import SwiftUI

extension Font {
    static func appFont(size: CGFloat) -> Font {
       return Font.custom("Poppins", size: size)
    }

    static let mlTitle = appFont(size: 22).weight(.semibold)
    static let mlDate = appFont(size: 20).weight(.semibold)
    static let mlBody = appFont(size: 14).weight(.medium)
    static let mlCaption = appFont(size: 12).weight(.regular)
    static let mlHeader = appFont(size: 36).weight(.bold)
    static let mlAchievement = appFont(size: 24).weight(.bold)
    static let mlAchievementIcoh = appFont(size: 32).weight(.bold)
    static let mlQuote = appFont(size: 24).weight(.bold).italic()
}
