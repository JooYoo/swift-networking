//
//  RandomImageViewModel.swift
//  random-image-quote
//
//  Created by Yu on 10.11.22.
//

import Foundation
import UIKit

struct RandomImageViewModel: Identifiable {
    let id = UUID()
    let randomImage: RandomImage
    
    var image: UIImage? {
        UIImage(data: randomImage.image)
    }
    
    var quote: String {
        randomImage.quote.content
    }
}
