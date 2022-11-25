//
//  Webservice.swift
//  PostList
//
//  Created by Yu on 25.11.22.
//

import Foundation

enum NetworkingError: Error {
    case badUrl
    case decodingError
    case badRequest
}

class Webservice {
    
    func getAllPosts(url: URL, completion: @escaping (Result<[Post], NetworkingError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            // data
            guard let data = data, error == nil else {
                completion(.failure(NetworkingError.badRequest))
                return
            }
            
            // decoding
            guard let posts = try? JSONDecoder().decode([Post].self, from: data) else {
                completion(.failure(NetworkingError.decodingError))
                return
            }
            
            // result
            completion(.success(posts))

        }.resume()
    }
}
