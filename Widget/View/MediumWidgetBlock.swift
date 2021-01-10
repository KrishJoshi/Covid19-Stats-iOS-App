import SwiftUI

struct mediumWidgetBlock: View {
    var data : Countries

    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text(data.emoji())
                Text(data.Country)
                Spacer()
            }
            .font(.system(size: 35))
            .foregroundColor(.black)
            .padding(.top,20)
            VStack(alignment:.leading) {
                Text("Total: "+data.TotalConfirmed.cases)
                    .foregroundColor(.coronapink)
                Text("Recovered: "+data.TotalRecovered.cases)
                    .foregroundColor(.coronagreen)
                Text("Deaths: "+data.TotalDeaths.cases)
                    .foregroundColor(.coronagrey)
                Text("Active: "+data.totalActive().cases)
                    .foregroundColor(.coronayellow)
            }
        }
        .padding(.bottom, 15)
    }
}
