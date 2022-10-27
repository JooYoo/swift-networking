//
//  Webservice.swift
//  AsyncAwaitFetchDate
//
//  Created by Yu on 27.10.22.
//

import Foundation

class Webservice {
    
    private func getDate() async throws -> CurrentDate? {
        // resolve url
        guard let url = URL(string: "https://ember-sparkly-rule.glitch.me/current-date") else {
            fatalError("url not available")
        }
        // fetch api data
        let (data, _) = try await URLSession.shared.data(from: url)
        // decode data to model
        let currentDate = try JSONDecoder().decode(CurrentDate.self, from: data)
        
        return currentDate
    }
}
