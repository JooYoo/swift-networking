//
//  Constants.swift
//  random-image-quote
//
//  Created by Yu on 10.11.22.
//

import Foundation

struct Constants {
    
    struct Url{
        
        static func getRandomImageUrl() -> URL?{
            return URL(string: "https://picsum.photos/200?uuid=\(UUID().uuidString)")
        }
        
        static let randomQuote: URL? = URL(string: "https://api.quotable.io/random")
    }
}
