//
//  WeatherData.swift
//  sınav
//
//  Created by Lutfu on 21.01.2023.
//

import Foundation

import Foundation
// MARK: - CurrentPrice
// MARK: - Datum
// MARK: - Datum
class WeatherData: Codable {
    var number, location: String

    init(number: String, location: String) {
        self.number = number
        self.location = location
    }
}
