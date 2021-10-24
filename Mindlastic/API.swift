//
//  API.swift
//  Mindlastic
//
//  Created by garrepi on 10/23/21.
//

import Foundation

struct API {
    static let baseURL = URL(string: "https://hackgt.garrepi.dev:5900")!
    static func postJournal(_ text: String) {
        let fullURL = baseURL.appendingPathComponent("/api/user/post-journal")
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
                print("Error making PUT request: \(error.localizedDescription)")
                return
            }
            
            if let responseCode = (response as? HTTPURLResponse)?.statusCode, let responseData = responseData {
                guard responseCode == 200 else {
                    print("Invalid response code: \(responseCode)")
                    return
                }
                
                if let responseJSONData = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) {
                    print("Response JSON data = \(responseJSONData)")
                }
            }
        }.resume()
    }
}
