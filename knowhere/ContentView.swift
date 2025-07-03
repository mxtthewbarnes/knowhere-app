import SwiftUI
import CoreLocation
import Foundation

import SwiftEntryKit

// Game states
enum GameState {
    case loading
    case mainMenu
    case playing
    case mapGuess
}

// Random locations
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

func generateRandomCoordinate() -> CLLocationCoordinate2D {
    return usCoordinates.randomElement()!
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
    
    
    
    //  Results message built using Swift ENtry Kit
    func resultsPopup(miles: Double, roundScore: Int, totalScore: Int) {
        //theme color
        let darkSlateGrey = UIColor(red: 47/255, green: 79/255, blue: 79/255, alpha: 1.0)
        let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
        
        let title = EKProperty.LabelContent(
            text: String(format: "%.2fmi away", miles),
            style: .init(
                font: UIFont(name: "pacifico", size: 35) ?? .systemFont(ofSize: 25),
                color: EKColor(darkSlateGrey))
            )
        

        let description = EKProperty.LabelContent(
            
            text: String(format: "%dpts ", roundScore),
            style: .init(font: .systemFont(ofSize: 20),
                         color: EKColor(darkSlateGrey))
            
        )

        let buttonLabel = EKProperty.LabelContent(
            text: "Next Round",
            style: .init(
                font: UIFont(name: "pacifico", size: 25) ?? .systemFont(ofSize: 25),
                color: EKColor(.white)
            )
        )

        
        //comment to push and test if sensitive data is detected by github - disregard comment
        let button = EKProperty.ButtonContent(
            label: buttonLabel,
            backgroundColor: (EKColor(hotOrange)),
            highlightedBackgroundColor: (EKColor(hotOrange).with(alpha: 0.9)),
            action: {
                SwiftEntryKit.dismiss()
            }
                                               
                                               
        )

        let popupMsg = EKPopUpMessage(
            title: title,
            description: description,
            button: button,
            action: {
                SwiftEntryKit.dismiss()
                self.actualCoordinate = generateRandomCoordinate()
                self.gameState = .playing
            }
        )
                

        var attributes = EKAttributes.bottomFloat
        attributes.entryBackground = .color(color: .init(UIColor.white))
        attributes.displayDuration = .infinity
        attributes.entryInteraction = .absorbTouches
        attributes.screenInteraction = .forward
        attributes.roundCorners = .all(radius: 12)
        attributes.lifecycleEvents.didDisappear = {
            self.gameState = .playing
        }

        SwiftEntryKit.display(entry: EKPopUpMessageView(with: popupMsg), using: attributes)
    }
    
    
    //timer color change function
    private var timerColor: Color{
        if timeRemaining < 5
        {
            return .red
        }
        else if timeRemaining < 8
        {
            return .orange
        }
        else if timeRemaining < 15
        {
            return .yellow
        }
        else{
            return .white
        }
    }

    
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
                            .foregroundColor(timerColor)
                                   Text("\(timeRemaining)s")
                            .foregroundColor(timerColor)
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
                                    .font(.custom("pacifico", size: 33))
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

                        
                        
                        // Score in bottom band - removing for now to test and see what Guess looks like on its own
                        /*HStack(spacing: 5) {
                            Text("Score: \(totalScore)")
                                .foregroundColor(.white)
                                .font(.headline)
                                
                        }*/

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
                    gameState = .mainMenu
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
                    
                    if let miles = distanceInMiles {
                        let maxScore = 3500
                        roundScore = max(0, Int(Double(maxScore) - miles * 6))
                        totalScore += roundScore
                        
                        
                        //call swift entrykit popup
                        showResultsPopup?(miles, roundScore, totalScore)
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
        
        }
    }
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
