//
//  JournalEntryView.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation
import SwiftUI

struct JournalEntryView: View {
    @State private var fullText: String = "This is some editable text..."
    var body: some View {
        TextEditor(text: $fullText)
            .navigationBarHidden(false)
            .navigationTitle("Sat Oct 23")
    }
}

struct JournalEntryView_Preview: PreviewProvider {
    static var previews: some View {
        JournalEntryView()
    }
}
