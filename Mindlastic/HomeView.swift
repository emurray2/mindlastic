//
//  HomeView.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.mlNavy
                    .ignoresSafeArea()
                ScrollView {
                    Text("Welcome, name")
                        .modifier(Title())
                    NavigationLink(destination: JournalEntryView()) {
                        HStack {
                            VStack(alignment:.leading) {
                                Text("New Entry")
                                    .font(.mlTitle)
                                    .foregroundColor(.mlYella)
                                Text("Sat Oct 23")
                                    .font(.mlBody)
                                    .foregroundColor(.mlOrange)
                            }
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .font(Font.system(size: 50, weight: .semibold, design: .default))
                                .foregroundColor(.mlOrange)
                        }.padding(.horizontal)
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .modifier(Card(backgroundColor: .mlBlue))
                        .padding(.horizontal)
                    }
                    
                    Text("This month")
                        .modifier(Title())
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
                        }
                    }.padding(.horizontal)
                    Text("Your entries")
                        .modifier(Title())
                    VStack {
                        NavigationLink {
                            AnalyticView()
                        } label: {
                            JournalEntry(icon: "pencil", subtitle: "Entry 1")
                        }
                        JournalEntry(icon: "pencil", subtitle: "Entry 2")
                        JournalEntry(icon: "pencil", subtitle: "Entry 3")
                        JournalEntry(icon: "pencil", subtitle: "Entry 4")
                        JournalEntry(icon: "pencil", subtitle: "Entry 5")
                    }
                }
            }
            .navigationBarHidden(true)
        }.navigationBarTitle("")
        .navigationBarHidden(true)

    }
}

struct AchievementCard: View {
    let icon: String
    let subtitle: String
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(subtitle)
        }.modifier(Card(backgroundColor: .mlOrange))
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

struct PublishButton: View {
    let subtitle: String
    var width: CGFloat = 20
    var height: CGFloat = 50
    var body: some View {
        VStack {
            Text(subtitle)
        }.modifier(Card(backgroundColor: .mlDarkBlue, width: width, height: height))
    }
}

struct JournalEntry: View {
    let icon: String
    let subtitle: String
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(subtitle)
        }.modifier(Card(backgroundColor: .mlDarkOrange, width: 150, height: 30))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.mlTitle)
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct Card: ViewModifier {
    let backgroundColor: Color
    var width: CGFloat = 20
    var height: CGFloat = 50
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.horizontal, width)
            .padding(.vertical, height)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AchievementCardView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
    }
}
