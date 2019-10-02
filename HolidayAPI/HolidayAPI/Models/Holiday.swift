//
//  Holiday.swift
//  HolidayAPI
//
//  Created by Josh Sparks on 10/2/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import Foundation

struct TopLevelDict: Codable {
    let holidays: [Holidays]
}

struct Holidays: Codable {
    let name: String
    let date: String
    let country: String
    let weekday: Weekday
    
}

struct Weekday: Codable {
    let observed: Observed
}

struct Observed: Codable {
    let name: String
    let numeric: String
}


