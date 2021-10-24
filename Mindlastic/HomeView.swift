//
//  HomeView.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State var journalEntries = [JournalEntry(as: "nothin!!")]
    
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
                            AchievementCard(icon: "hands.clap.fill", subtitle: "27 Day Streak")
                            AchievementCard(icon: "figure.walk", subtitle: "15 Min Walks")
                            AchievementCard(icon: "bed.double.fill", subtitle: "8 Hrs Slept")
                        }
                    }.padding(.horizontal)
                    Text("Journals")
                        .modifier(Title())
                    
                    ForEach(journalEntries, id: \.self) { item in
                        NavigationLink {
                            AnalyticView(entry: item)
                        } label: {
                            JournalEntryCard(subtitle: item.summary ?? "Go fuck yourself")
                        }
                    }
                    .onAppear {
                        APIRedux().loadJournals { entries in
                            print(entries)
                            self.journalEntries = entries
                        }
                }
            }
            .navigationBarHidden(true)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct AchievementCard: View {
    let icon: String
    let subtitle: String
    var body: some View {
        VStack {
            Image(systemName: icon)
            Spacer()
            Text(subtitle)
                .font(.mlAchievement)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .frame(alignment: .leading)
        }
        .frame(maxWidth: 100, minHeight: 120)
        .modifier(Card(backgroundColor: .mlOrange))
        .padding(0)
    }
}


struct JournalEntryCard: View {
    let subtitle: String
    var body: some View {
        VStack(alignment: .center) {
            HStack {
               Text("Day")
                    .font(.mlCaption)
                Spacer()
                Text("Month and year")
                    .font(.mlCaption)
            }
            .frame( maxWidth: .infinity)
            Text(subtitle)
                .font(.mlBody)
        }
        .modifier(Card(backgroundColor: .mlDarkBlue, width: 150, height: 30))
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
