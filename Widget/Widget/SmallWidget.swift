//
//  SmallWidget.swift
//  Corona Widget
//
//  Created by Aaryan Kothari on 24/07/20.
//

import SwiftUI

//MARK: systemSmall Widget

struct smallWidget : View {
    // MARK - PROPERTIES
    var data : Countries
    @Environment(\.colorScheme) var colorScheme

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK - BODY
    var body : some View {
        VStack{
            HStack{
                Spacer()
                Text(data.emoji()).minimumScaleFactor(0.1)
                Text(data.Country).bold().minimumScaleFactor(0.1).lineLimit(1)
                Spacer()
            } //: HSTACK
            .font(.headline)
            .foregroundColor(colorScheme == .dark ? Color.white: Color.black)
            .padding(.all, 5)
            .padding(.top, 10)
            
            
            LazyVGrid(columns: columns, content: {
                smallWidgetBlock(type: .confirmedToday, count: data.NewConfirmed, color: .coronapink)
                smallWidgetBlock(type: .deaths, count: data.NewDeaths, color: .coronapink)
                smallWidgetBlock(type: .recovered, count: data.NewRecovered, color: .coronapink)
                smallWidgetBlock(type: .total, count: data.TotalConfirmed, color: .coronapink)
            })
        } //: VSTACK
    } //: BODY
}

//END

struct SmallWidget_Previews: PreviewProvider {
    static var previews: some View {
        smallWidget(data: Countries(Country: "United Kingdom", CountryCode: "UK", Slug: "uk", NewConfirmed: 10000, TotalConfirmed: 200000, NewDeaths: 101, TotalDeaths: 1324, NewRecovered: 3434, TotalRecovered: 33333, Date: "DATE"))
        
    }
}
