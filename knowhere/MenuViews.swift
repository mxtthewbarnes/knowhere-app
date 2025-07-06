//
//  MenuViews.swift
//  knowhere
//
//  Created by Matthew Barnes on 7/5/25.
//
import SwiftUI
import SwiftEntryKit

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
    let imageName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
                .background(.darkgreyslate)
                .cornerRadius(30)
            
            
        }
    }
}



// Main menu implementation
struct mainMenu: View {
    @Binding var gameState: GameState
    @Binding var mode: GameMode
    var body: some View {
        VStack(spacing: 30) {
            Text("Knowhere")
                .font(.custom("pacifico", size: 50))
                .foregroundColor(.darkgreyslate)
                .padding(.top, 60)
            HStack(spacing: 10) {
                menuButton(imageName: "usa-proper") {
                    gameState = .playing
                    mode = .usa
                }
                menuButton(imageName: "college") {
                    gameState = .playing
                    mode = .college
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white.ignoresSafeArea())
    }
}


//swift entry kit float message w/ highest score/round per gamemode
func modeFloat(mode: GameMode) {
    // initializing color
    let hotOrange = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
    
    let title = EKProperty.LabelContent(
        text: {
            switch mode {
            case .usa:
                return "United States"
            case .college:
                return "College Campuses"
            }
        }(),
        style: EKProperty.LabelStyle(
            font: UIFont.boldSystemFont(ofSize: 24),
            color: EKColor(.white),
            alignment: .center
        )
    )
    
    let desc = EKProperty.LabelContent(
        text: {
            switch mode {
            case .usa:
                return String(format: "Highest score: %d", loadHighScore(for: .usa))
            case .college:
                return String(format: "Highest score: %d", loadHighScore(for: .college))
            }
        }(),
        style: .init(
            font: .systemFont(ofSize: 15),
            color: EKColor(hotOrange),
            alignment: .center
            )
        )
    
    
    
    
    
    
    
}
