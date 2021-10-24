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
        sentiment = 0
        summary = nil
        text = ""
    }
    
    var id = UUID() // TODO: check to ensure this works with mongo
    let date: String?
    let sentiment: Double //TODO: convert to enum
    let summary: String?
    var text: String
    init(from decoder: Decoder) throws {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
       let values = try decoder.container(keyedBy: CodingKeys.self)
       id = (try? values.decode(UUID.self, forKey: .id)) ?? UUID()
       date = (try? values.decode(String.self, forKey: .date)) ?? "nil"
       sentiment = try values.decode(Double.self, forKey: .sentiment)
       summary = try? values.decode(String.self, forKey: .summary)
       text = try values.decode(String.self, forKey: .text)
        
        //let date1 = dateFormatter.date(from:isoDate)!
        // Sun, 24 Oct 2021 02:52:28 GMT",
   }
}
