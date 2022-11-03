//
//  NewsSourceListView.swift
//  NewsSource
//
//  Created by Yu on 01.11.22.
//

import SwiftUI

struct NewsSourceListView: View {
    @ObservedObject private var vm = NewsSourceListViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.newsSources, id: \.id) { newsSource in
                NavigationLink(destination: NewsArticleList(newsSource: newsSource)){
                    NewsSourceCell(newsSourceCellVm: newsSource)
                }
            }
            .listStyle(.plain)
            .navigationTitle("News Sources")
            .navigationBarItems(trailing: Button(action: {
                Task{
                    await vm.getNewsSources()
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
                await vm.getNewsSources()
            }
        }
    }
}

struct NewsSourceListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceListView()
    }
}
