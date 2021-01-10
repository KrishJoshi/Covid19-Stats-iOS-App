//
//  ContentView.swift
//  Watch App WatchKit Extension
//
//  Created by Krish Joshi on 03/11/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = SessionStore()
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var body: some View {
        let sortByToday = store.summaryData?.Countries.sorted {
            $0.NewConfirmed > $1.NewConfirmed
        } ?? []
        
        let sortByTotal = store.summaryData?.Countries.sorted {
            $0.TotalConfirmed > $1.TotalConfirmed
        } ?? []
    
        
        return TabView {
            ScrollView {
                LazyVStack {
                    ForEach(sortByToday, id: \.self) {
                        item in
                        Row(country:item.Country, count:  item.NewConfirmed, flag: item.emoji())
                    }
                }
            }.navigationTitle("New Cases")
            ScrollView {
                LazyVStack {
                    ForEach(sortByTotal, id: \.self) {
                        item in
                        Row(country:item.Country, count:  item.TotalConfirmed, flag: item.emoji())
                    }
                }
            }.navigationTitle("Total Cases")
        }.tabViewStyle(PageTabViewStyle()).onAppear(perform: fetch).onLongPressGesture(perform: fetch)
    }
    
    
    func fetch() {
        store.fetch{ data in }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
