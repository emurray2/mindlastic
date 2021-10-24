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
            ScrollView {
                VStack {
                    Text("Sat Oct 23")
                    .font(.mlHeader)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
                VStack {
                    HStack(alignment: .top) {
                        JournalStat(value: "\(entry.sentiment.truncate(places: 3))", subtitle: "sentiment", color: .mlOrange, width: 50, height: 50)
                        JournalStat(value: "\(entry.text.split(separator: " ").count)", subtitle: "words", color: .mlDarkOrange, width: 50, height: 50)
                    }
                    .padding(.horizontal)
               }
                Text(entry.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
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

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
