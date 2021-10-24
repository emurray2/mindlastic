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
   static let mlBody = appFont(size: 14).weight(.medium)
   static let mlCaption = appFont(size: 12).weight(.regular)
   static let mlHeader = appFont(size: 36).weight(.bold)
}
