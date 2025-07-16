/*
 
 StreetViewData
 --------------
 parsing JSON info to be passed through func(s)
 
 
 */

import SwiftUI
import CoreLocation
import Foundation

struct locationList: Codable{
    let customCoordinates: [StreetViewLocation]
}

struct StreetViewLocation: Codable{
    let panoID: String
    let lat: Double
    let lng: Double
}




//
//primary func - passes parsed data through
//
func loadLocations(filename: String) -> [StreetViewLocation] {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        print("File not found: \(filename)")
        return []
    }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let list = try decoder.decode(locationList.self, from: data)
        return list.customCoordinates
    } catch {
        print("Failed to decode file: \(error)")
        return []
    }
}



