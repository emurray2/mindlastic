//
//  JournalEntryView.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation
import SwiftUI

struct JournalEntryView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    @State private var fullText: String = "This is some editable text..."
    var body: some View {
        ZStack {
            Color.mlNavy.ignoresSafeArea()
            VStack {
                TextEditor(text: $fullText)
                    .navigationBarHidden(false)
                    .navigationTitle("Sat Oct 23")
                    .padding()
                    .onAppear {
                        API.postJournal("hello world...?")
                    }
                    .font(.mlBody)
                Button {

                } label: {
                    PublishButton(subtitle: "Publish", width: 150, height: 35)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct JournalEntryView_Preview: PreviewProvider {
    static var previews: some View {
        JournalEntryView()
    }
}
