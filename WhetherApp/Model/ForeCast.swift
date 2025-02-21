//
//  ForeCast.swift
//  WhetherApp
//
//  Created by Suraj-KU on 18/02/25.
//

import Foundation


struct DayForcast : Identifiable {
    var id = UUID().uuidString
    var day: String
    var fareheit: CGFloat
    var image: String
}


var foreCast: [DayForcast] = [
    DayForcast(day: "Today", fareheit: 94, image: "sun.min"),
    DayForcast(day: "Wed", fareheit: 90, image: "cloud.sun"),
    DayForcast(day: "Tue", fareheit: 98, image: "cloud.sun.bolt"),
    DayForcast(day: "Thu", fareheit: 99, image: "sun.max"),
    DayForcast(day: "Fri", fareheit: 92, image: "cloud.sun"),
    DayForcast(day: "Sat", fareheit: 91, image: "cloud.sun"),
    DayForcast(day: "Sun", fareheit: 93, image: "sun.max"),
    DayForcast(day: "Mon", fareheit: 95, image: "sun.max"),
    DayForcast(day: "Tue", fareheit: 94, image: "cloud.sun.bolt"),
    DayForcast(day: "Wed", fareheit: 94, image: "sun.min"),
    
]
