//
//  AnalyticView.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation
import SwiftUI

struct AnalyticView: View {
    let entry: JournalEntry
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
                    HStack(alignment: .top) {
                        JournalStat(value: "52%", subtitle: "angry", color: .mlOrange, width: 50, height: 50)
                        Spacer()
                        JournalStat(value: "1532", subtitle: "words", color: .mlDarkOrange, width: 50, height: 50)
                    }
                    .padding(.horizontal)
                    JournalStat(isQuote: true, value: "\"My dog died and that made me sad\"", subtitle: "summary", color: .mlDarkBlue, width: 90, height: 30)
               }
                Text(entry.text)
            }
        }
    }
}
struct JournalStat: View {
    var isQuote = false
    let value: String
    let subtitle: String
    let color: Color
    var width: CGFloat = 20
    var height: CGFloat = 50
    var body: some View {
        VStack {
            if isQuote {
                Text(value)
                .font(.mlQuote)
                .lineLimit(3)
            } else {
                Text(value)
                .font(.mlHeader)
            }
            Text(subtitle)
        }.modifier(Card(backgroundColor: color, width: width, height: height))
    }
}


struct AnalyticView_Preview: PreviewProvider {
    static var previews: some View {
        AnalyticView(entry: JournalEntry(as: "fggfdsafghjgdasadfgf"))
    }
}
