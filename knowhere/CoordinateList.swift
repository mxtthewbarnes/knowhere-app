//
//  CoordinateList.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI
import CoreLocation

//US Coordinates
let usCoordinates: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), // NYC
    CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), // LA
    CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298), // Chicago
    CLLocationCoordinate2D(latitude: 29.7604, longitude: -95.3698), // Houston
    CLLocationCoordinate2D(latitude: 33.4484, longitude: -112.0740), // Phoenix
    CLLocationCoordinate2D(latitude: 39.7392, longitude: -104.9903), // Denver
    CLLocationCoordinate2D(latitude: 32.7157, longitude: -117.1611), // San Diego
    CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321), // Seattle
    CLLocationCoordinate2D(latitude: 25.7617, longitude: -80.1918), // Miami
    CLLocationCoordinate2D(latitude: 44.9778, longitude: -93.2650), // Minneapolis
    CLLocationCoordinate2D(latitude: 39.7684, longitude: -86.1581), // Indianapolis
    CLLocationCoordinate2D(latitude: 42.3601, longitude: -71.0589), // Boston
    CLLocationCoordinate2D(latitude: 36.1627, longitude: -86.7816), // Nashville
    CLLocationCoordinate2D(latitude: 38.9072, longitude: -77.0369), // Washington, DC
    CLLocationCoordinate2D(latitude: 35.2271, longitude: -80.8431), // Charlotte
    CLLocationCoordinate2D(latitude: 45.5152, longitude: -122.6784), // Portland
    CLLocationCoordinate2D(latitude: 36.1699, longitude: -115.1398), // Las Vegas
    CLLocationCoordinate2D(latitude: 30.2672, longitude: -97.7431), // Austin
    CLLocationCoordinate2D(latitude: 35.1495, longitude: -90.0490), // Memphis
    CLLocationCoordinate2D(latitude: 33.7490, longitude: -84.3880), // Atlanta
    CLLocationCoordinate2D(latitude: 43.0389, longitude: -87.9065), // Milwaukee
    CLLocationCoordinate2D(latitude: 39.9612, longitude: -82.9988), // Columbus
    CLLocationCoordinate2D(latitude: 27.9506, longitude: -82.4572), // Tampa
    CLLocationCoordinate2D(latitude: 36.7378, longitude: -119.7871), // Fresno
    CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458), // Detroit
    CLLocationCoordinate2D(latitude: 39.1031, longitude: -84.5120), // Cincinnati
    CLLocationCoordinate2D(latitude: 35.7796, longitude: -78.6382), // Raleigh
    CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // San Francisco
    CLLocationCoordinate2D(latitude: 40.4406, longitude: -79.9959), // Pittsburgh
    CLLocationCoordinate2D(latitude: 37.3382, longitude: -121.8863), // San Jose
    CLLocationCoordinate2D(latitude: 39.7392, longitude: -104.9903),
    CLLocationCoordinate2D(latitude: 40.7608, longitude: -111.8910), // Salt Lake City
    CLLocationCoordinate2D(latitude: 33.5207, longitude: -86.8025), // Birmingham
    CLLocationCoordinate2D(latitude: 27.3364, longitude: -82.5307), // Sarasota
    CLLocationCoordinate2D(latitude: 30.3322, longitude: -81.6557), // Jacksonville
    CLLocationCoordinate2D(latitude: 36.1628, longitude: -86.7816),
    CLLocationCoordinate2D(latitude: 38.2527, longitude: -85.7585), // Louisville
    CLLocationCoordinate2D(latitude: 35.0844, longitude: -106.6504), // Albuquerque
    CLLocationCoordinate2D(latitude: 35.9940, longitude: -78.8986), // Durham
    CLLocationCoordinate2D(latitude: 33.5186, longitude: -86.8104),
    CLLocationCoordinate2D(latitude: 32.7767, longitude: -96.7970), // Dallas
    CLLocationCoordinate2D(latitude: 29.9511, longitude: -90.0715), // New Orleans
    CLLocationCoordinate2D(latitude: 35.2220, longitude: -97.4395), // Norman
    CLLocationCoordinate2D(latitude: 44.0521, longitude: -123.0868), // Eugene
    CLLocationCoordinate2D(latitude: 38.8339, longitude: -104.8214), // Colorado Springs
    CLLocationCoordinate2D(latitude: 47.6588, longitude: -117.4260), // Spokane
    CLLocationCoordinate2D(latitude: 46.8772, longitude: -96.7898), // Fargo
    CLLocationCoordinate2D(latitude: 39.7392, longitude: -104.9903),
    CLLocationCoordinate2D(latitude: 36.1627, longitude: -86.7816),
    CLLocationCoordinate2D(latitude: 41.2565, longitude: -95.9345), // Omaha
    CLLocationCoordinate2D(latitude: 34.7465, longitude: -92.2896), // Little Rock
    CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
    CLLocationCoordinate2D(latitude: 43.6150, longitude: -116.2023), // Boise
    CLLocationCoordinate2D(latitude: 45.7833, longitude: -108.5007), // Billings
    CLLocationCoordinate2D(latitude: 40.8136, longitude: -96.7026), // Lincoln
    CLLocationCoordinate2D(latitude: 42.6526, longitude: -73.7562), // Albany
    CLLocationCoordinate2D(latitude: 37.9643, longitude: -91.8318), // Missouri
    CLLocationCoordinate2D(latitude: 33.0198, longitude: -96.6989), // Plano
    CLLocationCoordinate2D(latitude: 42.2808, longitude: -83.7430), // Ann Arbor
    CLLocationCoordinate2D(latitude: 38.9517, longitude: -92.3341), // Columbia, MO
    CLLocationCoordinate2D(latitude: 36.1539, longitude: -95.9928), // Tulsa
    CLLocationCoordinate2D(latitude: 40.5853, longitude: -105.0844), // Fort Collins
    CLLocationCoordinate2D(latitude: 34.1083, longitude: -117.2898), // San Bernardino
    CLLocationCoordinate2D(latitude: 33.7456, longitude: -117.8678), // Santa Ana
    CLLocationCoordinate2D(latitude: 35.4676, longitude: -97.5164), // OKC
    CLLocationCoordinate2D(latitude: 37.8044, longitude: -122.2711), // Oakland
    CLLocationCoordinate2D(latitude: 42.8864, longitude: -78.8784), // Buffalo
    CLLocationCoordinate2D(latitude: 34.7304, longitude: -86.5861), // Huntsville
    CLLocationCoordinate2D(latitude: 39.1911, longitude: -106.8175), // Aspen
    CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
    CLLocationCoordinate2D(latitude: 36.7477, longitude: -119.7724),
    CLLocationCoordinate2D(latitude: 32.7555, longitude: -97.3308), // Fort Worth
    CLLocationCoordinate2D(latitude: 34.4208, longitude: -119.6982), // Santa Barbara
    CLLocationCoordinate2D(latitude: 33.6846, longitude: -117.8265), // Irvine
    CLLocationCoordinate2D(latitude: 37.4419, longitude: -122.1430), // Palo Alto
    CLLocationCoordinate2D(latitude: 33.8366, longitude: -117.9143), // Anaheim
    CLLocationCoordinate2D(latitude: 40.01499, longitude: -105.2705), // Boulder
    CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2730), // Berkeley
    CLLocationCoordinate2D(latitude: 40.9254, longitude: -74.2765), // Clifton, NJ
    CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),
    CLLocationCoordinate2D(latitude: 39.2904, longitude: -76.6122), // Baltimore
    CLLocationCoordinate2D(latitude: 34.0007, longitude: -81.0348), // Columbia, SC
    CLLocationCoordinate2D(latitude: 42.9634, longitude: -85.6681), // Grand Rapids
    CLLocationCoordinate2D(latitude: 41.6005, longitude: -93.6091), // Des Moines
    CLLocationCoordinate2D(latitude: 38.5791, longitude: -121.4910), // Sacramento
    CLLocationCoordinate2D(latitude: 43.0731, longitude: -89.4012), // Madison
    CLLocationCoordinate2D(latitude: 45.5122, longitude: -122.6587),
    CLLocationCoordinate2D(latitude: 40.4406, longitude: -79.9959),
    CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129) // Geographic center
]
