//
//  CurrentDateListViewModel.swift
//  AsyncAwaitFetchDate
//
//  Created by Yu on 28.10.22.
//

import Foundation

class CurrentDateListViewModel: ObservableObject {
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func populateDates() async throws {
        do{
            // fetch currentDate data
            let currentDate = try await Webservice().getDate()
            guard let currentDate = currentDate else {
                return
            }
            // map API data to App data
            let currentDateViewModel  = CurrentDateViewModel(currentDate: currentDate)
            currentDates.append(currentDateViewModel)
        }catch {
            print(error)
        }
    }
}
