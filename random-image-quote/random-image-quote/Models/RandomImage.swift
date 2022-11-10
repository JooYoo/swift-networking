//
//  RandomImage.swift
//  random-image-quote
//
//  Created by Yu on 10.11.22.
//

import Foundation

struct RandomImage: Codable {
    let image: Data
    let quote: Quote
}

struct Quote: Codable {
    let content: String
}
