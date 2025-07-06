//
//  CoordinateList.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI
import CoreLocation
//--------------------------------------
//US Coordinates
//--------------------------------------
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
    CLLocationCoordinate2D(latitude: 27.9506, longitude: -82.4572), // Tampa
    CLLocationCoordinate2D(latitude: 36.7378, longitude: -119.7871), // Fresno
    CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458), // Detroit
    CLLocationCoordinate2D(latitude: 35.7796, longitude: -78.6382), // Raleigh
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
    CLLocationCoordinate2D(latitude: 33.5186, longitude: -86.8104),
    CLLocationCoordinate2D(latitude: 29.9511, longitude: -90.0715), // New Orleans
    CLLocationCoordinate2D(latitude: 35.2220, longitude: -97.4395), // Norman
    CLLocationCoordinate2D(latitude: 44.0521, longitude: -123.0868), // Eugene
    CLLocationCoordinate2D(latitude: 38.8339, longitude: -104.8214), // Colorado Springs
    CLLocationCoordinate2D(latitude: 47.6588, longitude: -117.4260), // Spokane
    CLLocationCoordinate2D(latitude: 46.8772, longitude: -96.7898), // Fargo
    CLLocationCoordinate2D(latitude: 39.7392, longitude: -104.9903),
    CLLocationCoordinate2D(latitude: 36.1627, longitude: -86.7816),
    CLLocationCoordinate2D(latitude: 34.7465, longitude: -92.2896), // Little Rock
    CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
    CLLocationCoordinate2D(latitude: 43.6150, longitude: -116.2023), // Boise
    CLLocationCoordinate2D(latitude: 45.7833, longitude: -108.5007), // Billings
    CLLocationCoordinate2D(latitude: 40.8136, longitude: -96.7026), // Lincoln
    CLLocationCoordinate2D(latitude: 42.6526, longitude: -73.7562), // Albany
    CLLocationCoordinate2D(latitude: 37.9643, longitude: -91.8318), // Missouri
    CLLocationCoordinate2D(latitude: 33.0198, longitude: -96.6989), // Plano
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
    CLLocationCoordinate2D(latitude: 33.6846, longitude: -117.8265), // Irvine
    CLLocationCoordinate2D(latitude: 37.4419, longitude: -122.1430), // Palo Alto
    CLLocationCoordinate2D(latitude: 33.8366, longitude: -117.9143), // Anaheim
    CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2730), // Berkeley
    CLLocationCoordinate2D(latitude: 40.9254, longitude: -74.2765), // Clifton, NJ
    CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),
    CLLocationCoordinate2D(latitude: 39.2904, longitude: -76.6122), // Baltimore
    CLLocationCoordinate2D(latitude: 34.0007, longitude: -81.0348), // Columbia, SC
    CLLocationCoordinate2D(latitude: 43.0731, longitude: -89.4012), // Madison
    CLLocationCoordinate2D(latitude: 45.5122, longitude: -122.6587),
    CLLocationCoordinate2D(latitude: 40.4406, longitude: -79.9959),
    CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129), // Geographic center
    
    
    CLLocationCoordinate2D(latitude: 47.67393331347467, longitude: -116.79362910425603), //CDA
    CLLocationCoordinate2D(latitude: 47.34457244951391, longitude: -122.33049783665533), //federal way
    CLLocationCoordinate2D(latitude: 40.77682860013312, longitude: -74.01215864931463), //new york
    CLLocationCoordinate2D(latitude: 40.71953348648525, longitude: -74.00864300985727),
    //new york
    CLLocationCoordinate2D(latitude: 40.723087945311136, longitude: -73.99871839446946),
    //new york
    CLLocationCoordinate2D(latitude: 41.88576790010122, longitude: -87.63527122021871), //chicago
    CLLocationCoordinate2D(latitude: 47.58942915045632, longitude: -122.33421339100062), //seattle
    CLLocationCoordinate2D(latitude: 33.85530119539349, longitude: -116.55784049146372),
    //palm springs
    CLLocationCoordinate2D(latitude: 33.921216476598104, longitude: -116.71025793465377),
    //nevada
    CLLocationCoordinate2D(latitude: 32.53996721415149, longitude: -117.06303472075052),
    //san diego border
    CLLocationCoordinate2D(latitude: 32.72774560426337, longitude: -117.17939466465327),
    //san diego
    CLLocationCoordinate2D(latitude: 34.09607559105018, longitude: -118.4351146269097),
    //beverly hills
    CLLocationCoordinate2D(latitude: 28.258362124432036, longitude: -81.2820554456191),
    //st cloud
    CLLocationCoordinate2D(latitude: 28.085602770846993, longitude: -80.58791714048799),
    //melbourne beach
    CLLocationCoordinate2D(latitude: 25.774074398517143, longitude: -80.1509659824355)
    //miami
    
    
]



//--------------------------------------
//          College Coords
//--------------------------------------
let collegeCoords: [CLLocationCoordinate2D] = [
    // Big Ten
    CLLocationCoordinate2D(latitude: 40.1020, longitude: -88.2272), // Illinois
    CLLocationCoordinate2D(latitude: 39.1805, longitude: -86.5254), // Indiana
    CLLocationCoordinate2D(latitude: 41.6611, longitude: -91.5302), // Iowa
    CLLocationCoordinate2D(latitude: 38.9897, longitude: -76.9378), // Maryland
    CLLocationCoordinate2D(latitude: 42.2659, longitude: -83.7487), // Michigan
    CLLocationCoordinate2D(latitude: 42.7310, longitude: -84.4870), // Michigan State
    CLLocationCoordinate2D(latitude: 44.9760, longitude: -93.2261), // Minnesota
    CLLocationCoordinate2D(latitude: 40.8206, longitude: -96.7056), // Nebraska
    CLLocationCoordinate2D(latitude: 42.0553, longitude: -87.6753), // Northwestern
    CLLocationCoordinate2D(latitude: 40.0017, longitude: -83.0197), // Ohio State
    CLLocationCoordinate2D(latitude: 44.0582, longitude: -123.0681), // Oregon
    CLLocationCoordinate2D(latitude: 40.8079, longitude: -77.8567), // Penn State
    CLLocationCoordinate2D(latitude: 40.4237, longitude: -86.9212), // Purdue
    CLLocationCoordinate2D(latitude: 40.5100, longitude: -74.4641), // Rutgers
    CLLocationCoordinate2D(latitude: 34.0689, longitude: -118.4452), // UCLA
    CLLocationCoordinate2D(latitude: 34.0211, longitude: -118.2870), // USC
    CLLocationCoordinate2D(latitude: 47.6553, longitude: -122.3035), // Washington
    CLLocationCoordinate2D(latitude: 43.0696, longitude: -89.4116), // Wisconsin

    // SEC
    CLLocationCoordinate2D(latitude: 33.2081, longitude: -87.5504), // Alabama
    CLLocationCoordinate2D(latitude: 36.0687, longitude: -94.1754), // Arkansas
    CLLocationCoordinate2D(latitude: 32.6026, longitude: -85.4899), // Auburn
    CLLocationCoordinate2D(latitude: 29.6480, longitude: -82.3476), // Florida
    CLLocationCoordinate2D(latitude: 33.9490, longitude: -83.3751), // Georgia
    CLLocationCoordinate2D(latitude: 38.0223, longitude: -84.5058), // Kentucky
    CLLocationCoordinate2D(latitude: 30.4110, longitude: -91.1830), // LSU
    CLLocationCoordinate2D(latitude: 33.4552, longitude: -88.7890), // Mississippi State
    CLLocationCoordinate2D(latitude: 38.9359, longitude: -92.3277), // Missouri
    CLLocationCoordinate2D(latitude: 34.3634, longitude: -89.5372), // Ole Miss
    CLLocationCoordinate2D(latitude: 35.2059, longitude: -97.4426), // Oklahoma
    CLLocationCoordinate2D(latitude: 33.9734, longitude: -81.0190), // South Carolina
    CLLocationCoordinate2D(latitude: 35.9546, longitude: -83.9252), // Tennessee
    CLLocationCoordinate2D(latitude: 30.2839, longitude: -97.7322), // Texas
    CLLocationCoordinate2D(latitude: 30.6129, longitude: -96.3400), // Texas A&M
    CLLocationCoordinate2D(latitude: 36.1474, longitude: -86.8044), // Vanderbilt

    // ACC
    CLLocationCoordinate2D(latitude: 42.3355, longitude: -71.1685), // Boston College
    CLLocationCoordinate2D(latitude: 37.8719, longitude: -122.2585), // Cal
    CLLocationCoordinate2D(latitude: 34.6784, longitude: -82.8409), // Clemson
    CLLocationCoordinate2D(latitude: 36.0014, longitude: -78.9382), // Duke
    CLLocationCoordinate2D(latitude: 30.4383, longitude: -84.2990), // Florida State
    CLLocationCoordinate2D(latitude: 33.7756, longitude: -84.3963), // Georgia Tech
    CLLocationCoordinate2D(latitude: 38.2141, longitude: -85.7585), // Louisville
    CLLocationCoordinate2D(latitude: 25.7190, longitude: -80.2781), // Miami
    CLLocationCoordinate2D(latitude: 35.7847, longitude: -78.6821), // NC State
    CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469), // North Carolina
    CLLocationCoordinate2D(latitude: 40.4432, longitude: -79.9544), // Pitt
    CLLocationCoordinate2D(latitude: 32.8407, longitude: -96.7836), // SMU
    CLLocationCoordinate2D(latitude: 37.4275, longitude: -122.1697), // Stanford
    CLLocationCoordinate2D(latitude: 43.0379, longitude: -76.1349), // Syracuse
    CLLocationCoordinate2D(latitude: 38.0336, longitude: -78.5080), // Virginia
    CLLocationCoordinate2D(latitude: 37.2210, longitude: -80.4228), // Virginia Tech
    CLLocationCoordinate2D(latitude: 36.1326, longitude: -80.2770), // Wake Forest

    // Big 12
    CLLocationCoordinate2D(latitude: 32.2319, longitude: -110.9507), // Arizona
    CLLocationCoordinate2D(latitude: 33.4212, longitude: -111.9334), // Arizona State
    CLLocationCoordinate2D(latitude: 31.5489, longitude: -97.1180), // Baylor
    CLLocationCoordinate2D(latitude: 40.2518, longitude: -111.6493), // BYU
    CLLocationCoordinate2D(latitude: 39.1314, longitude: -84.5160), // Cincinnati
    CLLocationCoordinate2D(latitude: 40.0076, longitude: -105.2659), // Colorado
    CLLocationCoordinate2D(latitude: 29.7206, longitude: -95.3422), // Houston
    CLLocationCoordinate2D(latitude: 42.0265, longitude: -93.6465), // Iowa State
    CLLocationCoordinate2D(latitude: 38.9543, longitude: -95.2558), // Kansas
    CLLocationCoordinate2D(latitude: 39.1902, longitude: -96.5820), // Kansas State
    CLLocationCoordinate2D(latitude: 36.1266, longitude: -97.0687), // Oklahoma State
    CLLocationCoordinate2D(latitude: 32.7093, longitude: -97.3615), // TCU
    CLLocationCoordinate2D(latitude: 33.5843, longitude: -101.8747), // Texas Tech
    CLLocationCoordinate2D(latitude: 28.6024, longitude: -81.2001), // UCF
    CLLocationCoordinate2D(latitude: 40.7658, longitude: -111.8450), // Utah
    CLLocationCoordinate2D(latitude: 39.6503, longitude: -79.9559), // West Virginia
    
    
    // Washington State Cougars / Oregon State Beavers
    CLLocationCoordinate2D(latitude: 46.73088717091384, longitude: -117.16485682040057),
    CLLocationCoordinate2D(latitude: 46.73130332692996, longitude: -117.16592134930545),
    
    CLLocationCoordinate2D(latitude: 44.56017911533268, longitude: -123.2796107038167)
    
]
