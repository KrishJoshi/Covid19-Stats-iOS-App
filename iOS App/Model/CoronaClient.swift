//
//  CoronaClient.swift
//  Corona Widget
//
//  Created by Aaryan Kothari on 22/07/20.
//

import Foundation

// MARK:- NETWORKING CLASS

// Endoint to fetch stats on Cobid-19
private let summaryURL = URL(string: "")
private let countryURL = URL(string: "")


// JSON decoder used to comvert the fetched json into a struct
private var decoder: JSONDecoder{
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

class CoronaClient {
    // function to fetch covid-19 stats from `url`
    class func fetchSummary(onSuccess: @escaping (Corona) -> Void){
        guard let url = URL(string:"https://api.covid19api.com/summary") else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else{  return  }
            do{
                let coronaData = try decoder.decode(Corona.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(coronaData)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    class func fetchCountry(countrySlug:String, onSuccess: @escaping ([CountrySchema]) -> Void){
        guard let url = URL(string:"https://api.covid19api.com/total/dayone/country/\(countrySlug)/status/confirmed") else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else{  return  }

            
            do{
                let coronaData = try decoder.decode([CountrySchema].self, from: data)
                
                DispatchQueue.main.async {
                    onSuccess(coronaData)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}


