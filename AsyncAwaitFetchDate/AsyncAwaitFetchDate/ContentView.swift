//
//  ContentView.swift
//  AsyncAwaitFetchDate
//
//  Created by Yu on 21.10.22.
//

import SwiftUI

struct CurrentDate: Codable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(1...10, id:\.self) { i in
                Text("\(i)")
            }
            .listStyle(.plain)
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                // button action
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
