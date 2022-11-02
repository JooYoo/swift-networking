//
//  NewsSourceCell.swift
//  NewsSource
//
//  Created by Yu on 01.11.22.
//

import SwiftUI

struct NewsSourceCell: View {
    
    let newsSourceCellVm: NewsSourceCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(newsSourceCellVm.name)
                .font(.headline)
            Text(newsSourceCellVm.desicription)
        }
    }
}

struct NewsSourceCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceCell(newsSourceCellVm: NewsSourceCellViewModel(
            newsSource: NewsSource(
                id: "123",
                name: "ABC",
                description: "Lorem")
        ))
    }
}
