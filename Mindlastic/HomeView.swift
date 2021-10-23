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
        ScrollView {
            Text("Welcome, name")
            HStack {
                VStack {
                    Text("New Entry")
                    Text("Sat Oct 23")
                }
                Image(systemName: "square.and.pencil")
            }
            .modifier(Card())
            
            Text("This month")
            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
            AchievementCard(icon: "hands.clap.fill", subtitle: "Congrats")
        }
    }
}

struct AchievementCard: View {
    let icon: String
    let subtitle: String
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(subtitle)
        }.modifier(Card())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
struct Card: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
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
