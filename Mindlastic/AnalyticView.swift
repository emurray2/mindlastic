//
//  AnalyticView.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation
import SwiftUI

struct AnalyticView: View {
    var body: some View {
        ZStack {
            Color.mlNavy
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Sat Oct 23")
                    .font(.mlHeader)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
                VStack {
                    HStack {
                        JournalStat(value: "52%", subtitle: "angry", color: .mlOrange, width: 50, height: 50)
                        .padding()
                        JournalStat(value: "1532", subtitle: "words", color: .mlDarkOrange, width: 50, height: 50)
                    }
                    JournalStat(isQuote: true, value: "\"My dog died and that made me sad\"", subtitle: "summary", color: .mlDarkBlue, width: 90, height: 30)
                }
            }
        }
    }
}
