//
//  PostListViewModel.swift
//  AsyncPostList
//
//  Created by Yu on 25.11.22.
//

import Foundation

@MainActor
class PostListViewModel: ObservableObject {
    
    @Published var posts = [PostViewModel]()
    
    func populatePosts() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        do {
            let service = Webservice()
            let posts =  try await service.getAllPosts(url: url)
            self.posts = posts.map(PostViewModel.init)
        } catch {
            print(error)
        }
    }
}
