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
    case all
    case usa
    case college
    case europe
}




func generateRandomCoordinate() -> CLLocationCoordinate2D {
    return usCoordinates.randomElement()!
}


// Main app content view
struct ContentView: View {
    @State private var gameState: GameState = .loading
    @State private var actualCoordinate = generateRandomCoordinate()
    @State private var totalScore: Int = 0
    @State private var round: Int = 1
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
                mainMenu(gameState: $gameState)

            case .playing:
                GameView(gameState: $gameState, actualCoordinate: $actualCoordinate, totalScore: $totalScore)

            case .mapGuess:
                MapGuessingScreen(
                    actualCoordinate: actualCoordinate,
                    totalScore: $totalScore,
                    gameState: $gameState,
                    showResultsPopup : {miles, roundScore, totalScore in
                        GameView(
                            gameState: $gameState,
                            actualCoordinate: $actualCoordinate,
                            totalScore: $totalScore
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
