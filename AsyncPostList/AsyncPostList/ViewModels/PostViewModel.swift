//
//  PostViewModel.swift
//  AsyncPostList
//
//  Created by Yu on 25.11.22.
//

import Foundation

struct PostViewModel {
    let post: Post
    
    var id: Int {
        post.id
    }
    var title: String {
        post.title
    }
    var body: String {
        post.body
    }
}
