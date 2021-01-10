import SwiftUI

struct HomePage: View {
    @ObservedObject var store = SessionStore()
    @State private var searchText : String = ""
    @State private var sortByCases : Bool = true
    
    enum PageType {
        case New_Cases
        case Total_Cases
    }
    
    func PageTab(pageType: PageType) -> some View {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let sortedCountries = store.summaryData?.Countries.sorted {
            if(sortByCases) {
                return pageType == PageType.New_Cases ? $0.NewConfirmed > $1.NewConfirmed : $0.TotalConfirmed > $1.TotalConfirmed
            } else {
                return false
            }
        }.filter {
            self.searchText.isEmpty ? true : $0.Country.lowercased().contains(self.searchText.lowercased())
        } ?? []
        
        return NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(sortedCountries, id: \.self) { item in                        NavigationLink(destination: CountryPage(countrySlug: "\(item.Slug)")) {
                            Row(country:item.Country, count: numberFormatter
                                    .string(from: NSNumber(value: pageType == PageType.New_Cases ? item.NewConfirmed : item.TotalConfirmed))!, flag: item.emoji())
                        }
                    }
                }.padding(10)
            }.navigationBarTitle(Text(pageType == PageType.New_Cases ? "Today's new cases": "Total Cases"))
            .navigationBarItems(trailing:
                                    Button(sortByCases ? "Cases" :  "A/Z" ) {
                                        sortByCases = !sortByCases
                                    }
            )
        }
    }
    
    var body: some View {
        return TabView {
            PageTab(pageType: .New_Cases)
            .tabItem({Image(systemName: "calendar")
                        Text("Today")})
            PageTab(pageType: .Total_Cases)
            .tabItem( { Image(systemName: "rectangle.split.3x3.fill")
                        Text("Summary")} )
        }.onAppear(perform: fetch)
    }
    
    func fetch() {
        store.fetch{ data in }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
