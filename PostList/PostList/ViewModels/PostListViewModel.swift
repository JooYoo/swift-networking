//
//  PostListViewModel.swift
//  PostList
//
//  Created by Yu on 25.11.22.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts = [PostViewModel]()
    
    func populatePosts() {
        
        do {
            // url
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
                throw NetworkingError.badUrl
            }
            // posts
            Webservice().getAllPosts(url: url) { res in
                switch res {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.posts = posts.map(PostViewModel.init)                        
                    }
                case .failure(let err):
                    print(err)
                }
            }
            
        } catch {
            print(error)
        }
        
    }
}
