//
//  ContentView.swift
//  AsyncAwaitFetchDate
//
//  Created by Yu on 21.10.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = CurrentDateListViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.currentDates, id: \.id) { currentDate in
                Text(currentDate.date)
            }
            .listStyle(.plain)
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                Task {
                   await vm.populateDates()
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
                await vm.populateDates()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
