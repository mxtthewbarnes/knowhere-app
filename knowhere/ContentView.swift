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
}

//score tracking logic
func saveHighScore(_ score: Int, for mode: GameMode) {
    UserDefaults.standard.set(score, forKey: "HighScore_\(mode)")
}

func loadHighScore(for mode: GameMode) -> Int {
    return UserDefaults.standard.integer(forKey: "HighScore_\(mode)")
}



func generateRandomCoordinate(for mode: GameMode) -> CLLocationCoordinate2D {
    switch mode
    {
    case .usa:
        return usCoordinates.randomElement()!
    case .college:
        return collegeCoords.randomElement()!
    }
}


// Main app content view
struct ContentView: View {
    @State private var gameState: GameState = .loading
    @State private var actualCoordinate = generateRandomCoordinate(for: .usa)
    @State private var totalScore: Int = 0
    @State private var round: Int = 1
    @State private var mode: GameMode = .usa
    let maxRounds = 5
    
    var body: some View {
        ZStack {
            switch gameState {
            case .loading:
                loadingScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            gameState = .mainMenu
                        }
                    }
            case .mainMenu:
                mainMenu(gameState: $gameState,
                         mode: $mode)

            case .playing:
                GameView(gameState: $gameState, actualCoordinate: $actualCoordinate, totalScore: $totalScore, mode: $mode)

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
                            mode: $mode
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
