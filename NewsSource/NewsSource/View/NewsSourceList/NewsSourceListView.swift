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
                NewsSourceCell(newsSourceCellVm: newsSource)
            }
            .listStyle(.plain)
            .navigationTitle("News Sources")
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
