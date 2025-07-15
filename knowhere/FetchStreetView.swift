//
//  FetchStreetView.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/15/25.
//

import SwiftUI
import CoreLocation


//struct for longitude/latitud bounds
struct bounds{
    let maxLat: Double
    let maxLong: Double
    let minLat: Double
    let minLong: Double
}


//specific bounds for USA
let usaBounds = bounds(
    maxLat: 49, maxLong: -66, minLat: 24, minLong: -125
)



