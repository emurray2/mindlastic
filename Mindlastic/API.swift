//
//  API.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation

struct API {
    static let baseURL = URL(string: "https://hackgt.garrepi.dev")!

    static func postJournal(_ text: String, completion: @escaping((Result<Int, Error>) -> ())) {
        let fullURL = baseURL.appendingPathComponent("/api/user/add-journal")
        var request = URLRequest(url: fullURL)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let jsonDictionary: [String: String] = [
            "text": text,
        ]

        let data = try! JSONSerialization.data(withJSONObject: jsonDictionary, options: .prettyPrinted)
        
        URLSession.shared.uploadTask(with: request, from: data) { (responseData, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let responseCode = (response as? HTTPURLResponse)?.statusCode, let responseData = responseData {
                completion(.success(responseCode))
            }
        }.resume()
    }
}
