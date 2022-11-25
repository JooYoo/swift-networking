//
//  NewsSourceListViewModel.swift
//  NewsSource
//
//  Created by Yu on 01.11.22.
//

import Foundation

@MainActor
class NewsSourceListViewModel: ObservableObject {
    
    @Published var newsSources: [NewsSourceCellViewModel] = []
    
    func getNewsSources() async {
        
        do {
            let url = Constants.Urls.sources
            let newsSources = try await Webservice().fetchSources(url: url)
            self.newsSources = newsSources.map(NewsSourceCellViewModel.init)
        } catch {
            print(error)
        }
    }
    
}