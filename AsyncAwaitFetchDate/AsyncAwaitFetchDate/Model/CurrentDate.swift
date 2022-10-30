//
//  CurrentDate.swift
//  AsyncAwaitFetchDate
//
//  Created by Yu on 30.10.22.
//

import Foundation

struct CurrentDate: Codable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
