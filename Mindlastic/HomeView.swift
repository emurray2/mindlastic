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
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct Card: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 50)
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
