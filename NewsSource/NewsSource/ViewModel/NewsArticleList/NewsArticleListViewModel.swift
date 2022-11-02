//
//  NewsArticleListViewModel.swift
//  NewsSource
//
//  Created by Yu on 02.11.22.
//

import Foundation

class NewsArticleListViewModel: ObservableObject {
    @Published var newsArticles:[NewsArticleCellViewModel] = []
    
    func getArticlesBy(sourceId: String) async {
        let url = Constants.Urls.topHeadlines(by: sourceId)
        
        // Async/Await approach
        do {
            let newsArticles = try await Webservice().fetchArticles(url: url)
            DispatchQueue.main.async {
                self.newsArticles = newsArticles.map(NewsArticleCellViewModel.init)
            }
        } catch {
            print(error)
        }
        
        // Callback approach
        /*
        Webservice().fetchArticlesCallback(url: url) { res in
            switch res {
            case .success(let newsArticles):
                DispatchQueue.main.async {
                    self.newsArticles = newsArticles.map(NewsArticleCellViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
        }
        */
    }
}
