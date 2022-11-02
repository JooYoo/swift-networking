//
//  NewsSourceViewModel.swift
//  NewsSource
//
//  Created by Yu on 02.11.22.
//

import Foundation

struct NewsSourceCellViewModel {
    let newsSource: NewsSource
    
    var id: String {
        newsSource.id
    }
    var name: String {
        newsSource.name
    }
    var desicription: String {
        newsSource.description
    }
}
