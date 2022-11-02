//
//  NewsArticleList.swift
//  NewsSource
//
//  Created by Yu on 02.11.22.
//

import SwiftUI

struct NewsArticleList: View {
    let newsSource: NewsSourceCellViewModel
    @ObservedObject private var vm = NewsArticleListViewModel()
    
    var body: some View {
        List(vm.newsArticles, id: \.id) { article in
            NewsArticleCell(newsArticleCellVm: article)
        }
        .listStyle(.plain)
        .task {
            await vm.getArticlesBy(sourceId: newsSource.id)
        }
        .navigationTitle(newsSource.name)
    }
}

struct NewsArticleList_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleList(
            newsSource: NewsSourceCellViewModel(
                newsSource: NewsSource(
                    id: "abc",
                    name: "abc",
                    description: "Lore")
            )
        )
    }
}
