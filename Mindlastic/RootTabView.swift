//
//  TabView.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
           HomeView()
               .tabItem {
                   Label("Home", systemImage: "house.fill")
               }
            AnalyticView()
               .tabItem {
                   Label("Charts", systemImage: "heart.text.square.fill")
               }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}

