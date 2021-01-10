//
//  LargeWidgetBlock.swift
//  WidgetExtension
//
//  Created by Aaryan Kothari on 24/09/20.
//

import SwiftUI

struct LargeWidgetBlock: View {
    var data : CoronaData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            VStack(alignment:.leading){
                countStack(total: data.Global.TotalConfirmed,color: .coronapink, name: "confirmed")
                Spacer()
                countStack(total: data.Global.TotalRecovered,  color: .coronagreen, name: "recovered")
                Spacer()
                countStack(total: data.Global.TotalDeaths,color: .coronagrey, name: "deaths")
                Spacer()
                countStack(total: totalActive(),color: .coronayellow, name: "active")
            }
            VStack(alignment:.leading, spacing: 3){
                countStack(total: data.Global.NewConfirmed,color: .coronapink, name: "confirmed",isActive: true,type: .total)
                countStack(total: data.Global.NewRecovered, color: .coronagreen, name: "recovered",isActive: true,type: .recovered)
                countStack(total: data.Global.NewDeaths,color: .coronagrey, name: "deaths",isActive: true,type: .deaths)
            }
        }
    }
    
    func totalActive()-> Double{
        return data.Global.TotalConfirmed - data.Global.TotalDeaths - data.Global.TotalRecovered
    }
}

struct countStack : View {
    let total : Double
    let color : Color
    let name : String
    var isActive = false
    var type : coronaType = .total
    
    var body: some View {
        HStack{
            Group{
                if isActive{
                    Image(type.image)
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                }
            }
            Text((isActive ? "New " : "Total ") + "\(name) : \(total.withCommas())").bold()
        }
    }
}
