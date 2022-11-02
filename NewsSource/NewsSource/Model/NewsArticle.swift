//
//  NewsArticle.swift
//  NewsSource
//
//  Created by Yu on 02.11.22.
//

import Foundation

struct NewsArticleResponse: Codable {
    let articles: [NewsArticle]
}

struct NewsArticle: Codable {
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let content: String?
    let publishedAt: String
    let urlToImage: String?
}
