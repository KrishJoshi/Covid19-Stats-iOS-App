//
//  Country.swift
//  Corona Widget
//
//  Created by Krish Joshi on 31/10/2020.
//

import SwiftUI
import Charts

struct CountryPage: View {
    @ObservedObject var store = SessionStore()
    @State private var selectedChart = 0
    
    var countrySlug: String
    var selectors = ["Per Day", "Total Cases"]
    
    var body: some View {
        let dataset: [CountrySchema] = store.countryData?.filter({ (country) -> Bool in country.Province == ""}) ?? [];
        
        let chartData:[ChartDataEntry] = dataset.enumerated().map { (index, element) in
            let dateFormatter = ISO8601DateFormatter()
            let date = dateFormatter.date(from:element.Date)!
            
            return ChartDataEntry(x: date.timeIntervalSince1970, y: selectedChart == 1 ? element.Cases :  index > 0 ? element.Cases - dataset[index-1].Cases : element.Cases)
        }
        
        
        return
            VStack{
                Picker(selection: $selectedChart, label: Text("Which chart to show?")) {
                    ForEach(0..<selectors.count) { index in
                        Text(self.selectors[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
    
                LineChart(entries: chartData)
                
            }.padding(10)
            .onAppear(perform: fetch).navigationBarTitle(store.countryData?[0].Country ?? "Loading...")
        
        
    }
    
    
    func fetch() {
        store.fetchCountry(countrySlug: countrySlug)
    }
}

struct CountryPage_Previews: PreviewProvider {
    static var previews: some View {
        CountryPage(countrySlug: "united-kingdom")
    }
}
