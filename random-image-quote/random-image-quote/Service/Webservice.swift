//
//  Webservice.swift
//  random-image-quote
//
//  Created by Yu on 10.11.22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidImageId(Int)
    case decodingError
}

class Webservice {
    func getRadomImages(ids: [Int]) async throws-> [RandomImage] {
        var randomImages = [RandomImage]()
        
        try await withThrowingTaskGroup(of: (Int, RandomImage).self, body: { group in
            for id in ids {
                group.addTask { [self] in
                    return (id, try await getRandomImage(id: id))
                }
            }
            
            for try await (_, randomImage) in group {
                randomImages.append(randomImage)
            }
        })
        
        return randomImages
    }
    
    
    private func getRandomImage(id: Int) async throws -> RandomImage {
        
        // get URLs
        guard let randomImgUrl = Constants.Url.getRandomImageUrl() else {
            throw NetworkError.badUrl
        }
        guard let randomQuoteUrl = Constants.Url.randomQuote else {
            throw NetworkError.badUrl
        }
        
        // get api-data
        async let (imageData, _) = try await URLSession.shared.data(from: randomImgUrl)
        async let (quoteData, _) = try await URLSession.shared.data(from: randomQuoteUrl)
        
        // decoding
        /// Quote
        guard let quote = try? JSONDecoder().decode(Quote.self, from: try await quoteData) else {
            throw NetworkError.decodingError
        }
        
        return RandomImage(image: try await imageData, quote: quote)
    }
}
