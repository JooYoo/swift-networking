//
//  ContentView.swift
//  PostList
//
//  Created by Yu on 25.11.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = PostListViewModel()
    
    var body: some View {
        List(vm.posts, id: \.id) { post in
            Text(post.title)
        }
        .listStyle(.plain)
        .task {
            vm.populatePosts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
