//
//  HomeView.swift
//  Corona Widget
//
//  Created by Krish Joshi on 03/11/2020.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var coronaStore = SessionStore()
    
    var body: some View {
        let sortedCountries = store.summaryData?.Countries.sorted {
            $0.NewConfirmed > $1.NewConfirmed
        }.filter {
            self.searchText.isEmpty ? true : $0.Country.lowercased().contains(self.searchText.lowercased()) 
        } ?? []
        
        
        return LazyVStack {
            ForEach(sortedCountries, id: \.self) {
                item in
                NavigationLink(destination: CountryPage(countrySlug: "\(item.Slug)")) {
                    Row(country:item.Country, count: numberFormatter
                            .string(from: NSNumber(value: item.NewConfirmed))!, flag: item.emoji())
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
