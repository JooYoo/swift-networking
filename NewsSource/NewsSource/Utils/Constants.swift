//
//  Constants.swift
//  NewsSource
//
//  Created by Yu on 01.11.22.
//

import Foundation

struct Constants {
    
    struct Urls {
        // FIXME: add NewsAPI api-key here
        private static let apiKey = "API_KEY"
        
        static let sources = URL(string: "https://newsapi.org/v2/sources?apiKey=\(apiKey)")
        
        static func topHeadlines(by source: String) -> URL? {
            return URL(string: "https://newsapi.org/v2/top-headlines?sources=\(source)&apiKey=\(apiKey)")
        }
    }
}
