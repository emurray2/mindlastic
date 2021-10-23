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
                        HStack {
                            Image(systemName: "envelope")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.white)
                            Text("Email")
                        }
                    }
                    .padding()
                    Button {

                    } label: {
                        HStack {
                            Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            Text("Google")
                        }
                    }
                    .padding()
                    Button {

                    } label: {
                        Image("facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        Text("Facebook")
                    }
                    .padding()
                    Button {

                    } label: {
                        Image(systemName: "applelogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.white)
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
