//
//  GuessingScreen.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI
import CoreLocation
import SwiftEntryKit

// MapGuessingScreen
struct MapGuessingScreen: View {
    @State private var guessLocation: CLLocationCoordinate2D?
    let actualCoordinate: CLLocationCoordinate2D
    @State private var showResult = false
    @State private var distanceInMiles: Double?
    @Binding var totalScore: Int
    @Binding var gameState: GameState
    @State private var showSubmit = false
    @State private var roundScore: Int = 0
    @Binding var mode: GameMode
    var showResultsPopup: ((Double, Int, Int) -> Void)?
    var body: some View {
        ZStack {
            GuessMapView(selectedCoordinate: $guessLocation, actualCoordinate: showResult ? actualCoordinate : nil)
                .edgesIgnoringSafeArea(.all)
            
            if let _ = guessLocation, !showResult {
                Button(action: {
                    if let guess = guessLocation {
                        let actual = CLLocation(latitude: actualCoordinate.latitude, longitude: actualCoordinate.longitude)
                        let guessCL = CLLocation(latitude: guess.latitude, longitude: guess.longitude)
                        let distance = actual.distance(from: guessCL)
                        distanceInMiles = distance * 0.000621371
                        showResult = true
                    }
                    
                    //score logic
                    if let miles = distanceInMiles {
                        let meters = miles * 1609.34
                        let maxScore = 5000.0
                        let decayFactor = 2_000_000.0

                        let score = maxScore * exp(-meters / decayFactor)
                        let roundScore = Int(score)
                        totalScore += roundScore
                        
                        
                        //score tracking
                        if roundScore > loadHighScore(for: mode) {
                            saveHighScore(roundScore, for: mode)
                        }
                    
                        
                        
                        //call swift entrykit popup
                        showResultsPopup?(miles, roundScore, totalScore)
                    }
                    
                }) {
                    Text("Submit")
                        .font(.custom("pacifico", size: 30))
                        .foregroundColor(.white)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }
                .padding()
            }
        
        }
    }
}
