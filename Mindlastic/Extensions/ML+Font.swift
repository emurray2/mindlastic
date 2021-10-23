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
       return Font.custom("Poppins-Black", size: size)
   }
   
   static let mlTitle = appFont(size: 24).weight(.semibold)
   static let mlBody = appFont(size: 20).weight(.medium)
   static let mlCaption = appFont(size: 14).weight(.regular)
}
