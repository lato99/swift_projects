//
//  Weather.swift
//  sınav
//
//  Created by Lutfu on 21.01.2023.
//

// MARK: - Welcome
class Weather: Codable {
    var data: [WeatherData]
    init(data: [WeatherData]) {
        self.data = data
    }
}

