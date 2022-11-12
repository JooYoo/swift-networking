//
//  ContentView.swift
//  random-image-quote
//
//  Created by Yu on 10.11.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var vm = RandomImageListViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.randomImages){ randomImage in
                HStack {
                    randomImage.image.map { image in
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Text(randomImage.quote)
                }
            }
            .task {
                await vm.getRandomImageList(ids: Array(100...200))
            }
            .navigationTitle("Random")
            .navigationBarItems(trailing: Button(action: {
                Task{
                    await vm.getRandomImageList(ids: Array(100...200))
                }
            }, label: {
               Image(systemName: "arrow.clockwise.circle")
            }))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
