//
//  NewsArticleListViewModel.swift
//  NewsSource
//
//  Created by Yu on 02.11.22.
//

import Foundation

@MainActor
class NewsArticleListViewModel: ObservableObject {
    @Published var newsArticles:[NewsArticleCellViewModel] = []
    
    func getArticlesBy(sourceId: String) async {
        let url = Constants.Urls.topHeadlines(by: sourceId)
        
        do {
            let newsArticles = try await Webservice().fetchArticles(url: url)
            self.newsArticles = newsArticles.map(NewsArticleCellViewModel.init)
        } catch {
            print(error)
        }
    }
}
