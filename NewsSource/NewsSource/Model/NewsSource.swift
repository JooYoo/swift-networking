//
//  NewsSource.swift
//  NewsSource
//
//  Created by Yu on 01.11.22.
//

import Foundation

struct NewsSourceResponse: Codable {
    let sources: [NewsSource]
}

struct NewsSource: Codable {
    let id: String
    let name: String
    let description: String
}
