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
        let service = Webservice()
        randomImages = []
        
        do{
            try await withThrowingTaskGroup(of: (Int, RandomImage).self, body: { group in
                for id in ids {
                    group.addTask {
                        return (id, try await service.getRandomImage(id: id))
                    }
                }
                
                for try await (_, randomImage) in group {
                    randomImages.append(RandomImageViewModel(randomImage: randomImage))
                }
            })
            
        } catch {
            print(error)
        }
    }
}
