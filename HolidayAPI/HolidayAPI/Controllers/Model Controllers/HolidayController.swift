//
//  HolidayController.swift
//  HolidayAPI
//
//  Created by Josh Sparks on 10/2/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import Foundation

class HolidayController {
    
    static var baseURL = URL(string: "https://holidayapi.com/v1")
    
    static func fetchHoliday(completion: @escaping(([Holidays]) -> Void)) {
        
        guard let unwrappedURL = self.baseURL else { return }
        
        let holidayComponentURL = unwrappedURL.appendingPathComponent("holidays")
        
        let prettyQueryItem = URLQueryItem(name: "pretty", value: "")
        
        let keyQueryItem = URLQueryItem(name: "key", value: "9cabd77a-b31a-463f-89ae-5f48efece7aa")
        
        let countryQueryItem = URLQueryItem(name: "country", value: "US")
        
        let yearQueryItem = URLQueryItem(name: "year", value: "2018")
        
        var components = URLComponents(url: holidayComponentURL, resolvingAgainstBaseURL: true)
        
        components?.queryItems = [prettyQueryItem, keyQueryItem, countryQueryItem, yearQueryItem]
        
        guard let finalURL = components?.url else { return }
        
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error decoding the data \(error.localizedDescription)")
            }
            do {
                guard let data = data else { return }
                let jsonDecoder = JSONDecoder()
                let topLevelDict = try jsonDecoder.decode(TopLevelDict.self, from: data)
                print(topLevelDict.holidays)
//                var holidayArray: [Holidays] = []
//                for holiday in topLevelDict.holidays {
//                    holidayArray.append(Holidays(name: holiday.name, date: holiday.date, country: holiday.country, weekday: holiday.weekday))
//                }
            completion(topLevelDict.holidays)
            } catch {
                print("There was an error decoding the data")
            }
        }
        dataTask.resume()
    }
} // end of class
