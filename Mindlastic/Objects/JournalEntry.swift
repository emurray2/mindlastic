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
        date = nil
        sentiment = 0
        summary = nil
        text = ""
    }
    
    var id = UUID() // TODO: check to ensure this works with mongo
    let date: Date?
    let sentiment: Double //TODO: convert to enum
    let summary: String?
    var text: String
    init(from decoder: Decoder) throws {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "E, dd MMM yyyy hh:mm:ss"
       dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        
       let values = try decoder.container(keyedBy: CodingKeys.self)
        
       let convertedDate = try? values.decode(String.self, forKey: .date)
        date = dateFormatter.date(from: convertedDate ?? "ss") ?? nil
        
        
       id = (try? values.decode(UUID.self, forKey: .id)) ?? UUID()
       sentiment = try values.decode(Double.self, forKey: .sentiment)
       summary = try? values.decode(String.self, forKey: .summary)
       text = try values.decode(String.self, forKey: .text)
        
        //let date1 = dateFormatter.date(from:isoDate)!
        // Sun, 24 Oct 2021 02:52:28 GMT",
   }
}
