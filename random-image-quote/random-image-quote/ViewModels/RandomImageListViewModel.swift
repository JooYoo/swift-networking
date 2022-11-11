//
//  RandomImageListViewModel.swift
//  random-image-quote
//
//  Created by Yu on 10.11.22.
//

import Foundation

@MainActor
class RandomImageListViewModel:ObservableObject {
    @Published var randomImages: [RandomImageViewModel] = []
    
    func getRandomImageList(ids: [Int]) async {
        do{
            let randomImages = try await Webservice().getRadomImages(ids: ids)
            self.randomImages = randomImages.map(RandomImageViewModel.init)
        } catch {
            print(error)
        }
    }
}
