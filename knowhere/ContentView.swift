import SwiftUI
import CoreLocation
import Foundation

// Game states
enum GameState {
    case loading
    case mainMenu
    case playing
    case mapGuess
}

// Initial loading screen
struct loadingScreen: View {
    var body: some View {
        ZStack {
            Color(.darkgreyslate)
                .ignoresSafeArea()
            VStack {
                Text("Knowhere")
                    .font(.custom("pacifico", size: 36))
                    .foregroundColor(.white)
                Image("icon")
            }
            .padding()
        }
    }
}

// Button styling for menu
struct menuButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("pacifico", size: 20))
                .foregroundColor(Color(.darkgreyslate))
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
            
        }
    }
}

// Main menu implementation
struct mainMenu: View {
    @Binding var gameState: GameState
    var body: some View {
        VStack(spacing: 30) {
            Text("Knowhere")
                .font(.custom("pacifico", size: 50))
                .foregroundColor(.darkgreyslate)
                .padding(.top, 60)
            HStack(spacing: 10) {
                menuButton(title: "Play now") {
                    gameState = .playing
                }
                menuButton(title: "Scores") {
                    // TODO: Scores screen
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white.ignoresSafeArea())
    }
}

// GameView
struct GameView: View {
    @Binding var gameState: GameState
    @Binding var actualCoordinate: CLLocationCoordinate2D
    @Binding var totalScore: Int
    
    @State private var timeRemaining = 30
       @State private var timer: Timer?
       @State private var score = 0

    
    var body: some View {
        ZStack {
            StreetViewPanorama(coordinate: actualCoordinate)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                HStack{
                    Spacer()
                    HStack(spacing: 5) {
                                   Image(systemName: "clock.fill")
                                       .foregroundColor(.white)
                                   Text("\(timeRemaining)s")
                                       .foregroundColor(.white)
                                       .font(.headline)
                               }
                               .padding()
                           }

                ZStack {
                    // Toolbar background
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(height: 90) // Adjust as needed
                        .ignoresSafeArea(edges: .bottom)
                        .cornerRadius(30)

                    HStack(spacing: 20) {
                        Spacer()

                        // Guess button
                        Button(action: {
                            gameState = .mapGuess
                        }) {
                            HStack(spacing: 8) {
                                Text("Guess")
                                    .font(.custom("pacifico", size: 30))
                                    .foregroundColor(.white)
                                Image(systemName: "mappin.and.ellipse.circle.fill")
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .cornerRadius(10)
                        }

                        // Timer
                       /* HStack(spacing: 5) {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.white)
                            Text("\(timeRemaining)s")
                                .foregroundColor(.white)
                                .font(.headline)
                        }*/

                        // Score
                        HStack(spacing: 5) {
                            Text("Score: \(totalScore)")
                                .foregroundColor(.white)
                                .font(.headline)
                                
                        }

                        Spacer()
                    }
                }
            }
            
            .onAppear {
                startTimer()
            }
            .onDisappear {
                timer?.invalidate()
            }
        }
    }
        private func startTimer() {
            timer?.invalidate()
            timeRemaining = 30
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer?.invalidate()
                }
            }
        }
    }






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
                    
                    if let miles = distanceInMiles {
                        roundScore = Int(500000 / miles)
                        totalScore += roundScore
                    }
                    
                }) {
                    Text("Submit")
                        .font(.custom("pacifico", size: 30))
                        .foregroundColor(.darkgreyslate)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }
                .padding()
            }
            VStack{
                if let miles = distanceInMiles {
                    Text(String(format: "You were %.2f miles away!", miles))
                        .font(.headline)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                    VStack{
                        Text("Score this round: \(roundScore)")
                            .font(.headline)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                        VStack{
                            Text("Total score: \(totalScore)")
                                .font(.headline)
                                .padding()
                                .background(.ultraThinMaterial)
                                .cornerRadius(10)
                        }
                        }
                }
            }
        }
    }
}


// Main app content view
struct ContentView: View {
    @State private var gameState: GameState = .loading
    @State private var actualCoordinate = CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945)
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
                MapGuessingScreen(actualCoordinate: actualCoordinate, totalScore: $totalScore, gameState: $gameState)
            }
        }
    }
}

#Preview {
    ContentView()
}
