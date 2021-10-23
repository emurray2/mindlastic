//
//  ContentView.swift
//  Mindlastic
//
//  Created by Evan Murray on 10/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                VStack {
                    Text("Logo")
                    .padding()
                    .foregroundColor(Color.white)
                    Button {

                    } label: {
                        Text("Email")
                    }
                    .padding()
                    Button {

                    } label: {
                        Text("Google")
                    }
                    .padding()
                    Button {

                    } label: {
                        Text("Facebook")
                    }
                    .padding()
                    Button {

                    } label: {
                        Text("Apple ID")
                    }
                    .padding()
                }
                .padding(60)
                VStack {
                    Text("Have an account?")
                    .padding()
                    .foregroundColor(Color.white)
                    Button {

                    } label: {
                        Text("Log In")
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
