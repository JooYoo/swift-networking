//
//  NewsArticleCell.swift
//  NewsSource
//
//  Created by Yu on 02.11.22.
//

import SwiftUI

struct NewsArticleCell: View {
    let newsArticleCellVm: NewsArticleCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                AsyncImage(url: newsArticleCellVm.urlToImage) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: 100, maxHeight: 100)
                } placeholder: {
                    ProgressView("🍃")
                        .frame(maxWidth: 100, maxHeight: 100)
                }
                
                Text(newsArticleCellVm.title)
                    .fontWeight(.bold)
            }
            
            Text(newsArticleCellVm.description)
        }
       
    }
}

struct NewsArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleCell(newsArticleCellVm: NewsArticleCellViewModel(newsArticle: NewsArticle(author: "Jim", title: "Jim in CN", description: "Lorem", url: "https://google.com", content: "ok", publishedAt: "2022", urlToImage: "https://cdn.sstatic.net/Img/teams/teams-illo-free-sidebar-promo.svg?v=47faa659a05e")))
    }
}
