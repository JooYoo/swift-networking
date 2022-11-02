//
//  NewsArticleCellViewModel.swift
//  NewsSource
//
//  Created by Yu on 02.11.22.
//

import Foundation

struct NewsArticleCellViewModel {
    let newsArticle: NewsArticle
    
    let id = UUID()
    var title: String {
        newsArticle.title
    }
    var description: String {
        newsArticle.description ?? ""
    }
    var author: String {
        newsArticle.author ?? ""
    }
    var urlToImage: URL? {
        URL(string: newsArticle.urlToImage ?? "")
    }
}
