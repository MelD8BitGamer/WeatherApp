//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Melinda Diaz on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let latitude, longitude: Double
    let timezone: String
    //let currently: Currently
    let daily: Daily
}

// MARK: - Daily
struct Daily: Codable {
    let summary, icon: String
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int
    let summary, icon: String
    let sunriseTime, sunsetTime: Int
    let precipProbability: Double
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    
}


