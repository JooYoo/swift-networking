//
//  Webservice.swift
//  AsyncPostList
//
//  Created by Yu on 25.11.22.
//

import Foundation

class Webservice {
    
    func getAllPosts(url: URL) async throws -> [Post] {
        // fetch data
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // decode data
        let posts = try? JSONDecoder().decode([Post].self, from: data)
        
        return posts ?? []
    }
}
