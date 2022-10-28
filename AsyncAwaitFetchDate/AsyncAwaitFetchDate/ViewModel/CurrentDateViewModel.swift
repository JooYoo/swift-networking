//
//  CurrentDateViewModel.swift
//  AsyncAwaitFetchDate
//
//  Created by Yu on 28.10.22.
//

import Foundation

struct CurrentDateViewModel {
    let currentDate: CurrentDate
    var id: UUID {
        currentDate.id
    }
    var date: String {
        currentDate.date
    }
}
