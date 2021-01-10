import Foundation
import Combine

final class SessionStore: ObservableObject {
    @Published  var summaryData : Corona?
    @Published  var countryData : [CountrySchema]?
    
    public  func fetch(completion : @escaping(Corona)->()){
        CoronaClient.fetchSummary {
            self.summaryData = $0
            completion($0)
        }
    }
    
    public func fetchCountry(countrySlug: String){
        CoronaClient.fetchCountry(countrySlug: countrySlug, onSuccess:{ (countryData: [CountrySchema]) -> Void in
            self.countryData = countryData
        })
    }
}
