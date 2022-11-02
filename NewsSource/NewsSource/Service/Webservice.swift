//
//  Webservice.swift
//  NewsSource
//
//  Created by Yu on 01.11.22.
//

import Foundation

class Webservice {
    
    func fetchSources(url: URL?) async throws -> [NewsSource] {
        guard let url = url else {
            return []
        }
        
        let(data, _) = try await URLSession.shared.data(from: url)
        let newsSourceResponse = try? JSONDecoder().decode(NewsSourceResponse.self, from: data)
        
        return newsSourceResponse?.sources ?? []
    }
}
