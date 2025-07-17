import SwiftUI
import CoreLocation
import Foundation

import SwiftEntryKit

import AVFoundation


//Game states
enum GameState {
    case loading
    case mainMenu
    case playing
    case mapGuess
}

//Game modes
enum GameMode {
    case usa
    case college
    case europe
    case world
    
}

//score tracking logic
func saveHighScore(_ score: Int, for mode: GameMode) {
    UserDefaults.standard.set(score, forKey: "HighScore_\(mode)")
}

func loadHighScore(for mode: GameMode) -> Int {
    return UserDefaults.standard.integer(forKey: "HighScore_\(mode)")
}







//
//  loading JSONs (or other methods) into gamemodes
//
func generateRandomCoordinate(
    for mode: GameMode,
    locations: [GameMode: [StreetViewLocation]]
) -> CLLocationCoordinate2D? {
    if let modeLocations = locations[mode], let random = modeLocations.randomElement() {
        return CLLocationCoordinate2D(latitude: random.lat, longitude: random.lng)
    }

    switch mode {
    case .college:
        return collegeCoords.randomElement()
    default:
        return nil
    }
}



//main app content view
struct ContentView: View {
    @State private var gameState: GameState = .loading
    @State private var actualCoordinate: CLLocationCoordinate2D? = nil
    @State private var totalScore: Int = 0
    @State private var round: Int = 1
    @State private var mode: GameMode = .usa
    @State private var allLocations: [GameMode: [StreetViewLocation]] = [:]
    
    let maxRounds = 5
    
    
    
    
    var body: some View {
        ZStack {
            switch gameState {
            case .loading:
                loadingScreen()
                    .onAppear {
                        allLocations[.usa] = loadLocations(filename: "USAmap")
                        allLocations[.europe] = loadLocations(filename: "Europe 2")
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            gameState = .mainMenu
                        }
                    }
            case .mainMenu:
                MainMenu(
                    gameState: $gameState,
                    mode: $mode,
                    actualCoordinate: $actualCoordinate,
                    allLocations: allLocations)

            case .playing:
                GameView(gameState: $gameState,
                         actualCoordinate: $actualCoordinate,
                         totalScore: $totalScore,
                         mode: $mode,
                         allLocations: allLocations)

            case .mapGuess:
                MapGuessingScreen(
                    actualCoordinate: actualCoordinate,
                    totalScore: $totalScore,
                    gameState: $gameState,
                    mode: $mode,
                    showResultsPopup : {miles, roundScore, totalScore in
                        GameView(
                            gameState: $gameState,
                            actualCoordinate: $actualCoordinate,
                            totalScore: $totalScore,
                            mode: $mode,
                            allLocations: allLocations
                        ).resultsPopup(miles: miles, roundScore: roundScore, totalScore: totalScore)
                    }
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
