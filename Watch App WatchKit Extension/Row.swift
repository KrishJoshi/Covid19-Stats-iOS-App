//
//  Row.swift
//  Corona Widget
//
//  Created by Krish Joshi on 30/10/2020.
//

import SwiftUI

struct Row: View {
    var country: String
    var count: Double
    var flag: String
    var body: some View {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
       return VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text(flag)
            Text(country).multilineTextAlignment(.center)
            Text(numberFormatter
                    .string(from: NSNumber(value: count))!).fontWeight(.bold)
        }).foregroundColor(Color.white)
        .padding(10)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
        .cornerRadius(10)
        .shadow(radius: 10 )
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(country: "United Kingdom", count: 1234, flag: "🇬🇧")
    }
}
