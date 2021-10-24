//
//  APIRedux.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation

class APIRedux: ObservableObject {
    
    static let baseURL = URL(string: "https://hackgt.garrepi.dev")!
    func loadJournals(completion: @escaping([JournalEntry]) -> ()) {
        let url = APIRedux.baseURL.appendingPathComponent("/api/user/get-journal")
        URLSession.shared.dataTask(with: url) { data, response, error in
            // TODO: dont force unwrap
            guard let data = data else {
                completion([])
                return
            }
            let journals = try! JSONDecoder().decode([JournalEntry].self, from: data)
           
            print(journals)
            DispatchQueue.main.async {
                completion(journals)
            }
        }.resume()
    }
}
