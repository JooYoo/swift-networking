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
    
    func fetchArticles(url: URL?) async throws -> [NewsArticle] {
        try await withCheckedThrowingContinuation{ continuation in
            fetchArticlesCallback(url: url) { res in
                switch res {
                case .success(let articles):
                    continuation.resume(returning: articles)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func fetchArticlesCallback(url: URL?, completion: @escaping(Result<[NewsArticle], NetworkError>) -> Void){
        guard let url = url else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            guard let data = data, err == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            let newsArticleResponse = try? JSONDecoder().decode(NewsArticleResponse.self, from: data)
            completion(.success(newsArticleResponse?.articles ?? []))
        }.resume()
    }
}

enum NetworkError: Error {
    case badUrl
    case invalidData
    case decodingError
}
