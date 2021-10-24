//
//  JournalEntry.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation

struct JournalEntry: Codable, Identifiable, Hashable {
    init(as: String) {
        id = UUID()
        date = ""
        sentiment = ""
        summary = nil
        text = ""
    }
    
    var id = UUID() // TODO: check to ensure this works with mongo
    let date: String
    let sentiment: String //TODO: convert to enum
    let summary: String?
    var text: String
    init(from decoder: Decoder) throws {
       let values = try decoder.container(keyedBy: CodingKeys.self)
       id = (try? values.decode(UUID.self, forKey: .id)) ?? UUID()
       date = (try? values.decode(String.self, forKey: .date)) ?? "nil"
       sentiment = try values.decode(String.self, forKey: .sentiment)
       summary = try? values.decode(String.self, forKey: .summary)
       text = try values.decode(String.self, forKey: .text)
   }
}
