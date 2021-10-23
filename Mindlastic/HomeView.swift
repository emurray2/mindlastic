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
                            VStack {
                                Text("New Entry")
                                    .font(.mlBody)
                                Text("Sat Oct 23")
                                    .font(.mlCaption)
                            }
                            Image(systemName: "square.and.pencil")
                        }
                        .frame(maxWidth: .infinity)
                        .modifier(Card(backgroundColor: .mlBlue))
                        .padding()
                    }
                    
                    Text("This month")
                        .modifier(Title())
                        .padding(.trailing, 260)
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

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.mlTitle)
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .multilineTextAlignment(.leading)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
struct Card: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.top, 100)
            .padding(.bottom, 100)
            .padding(.trailing, 25)
            .padding(.leading, 25)
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
